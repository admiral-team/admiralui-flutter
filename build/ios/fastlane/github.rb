require 'dotenv'
require './build_info.rb'
require './utils.rb'
require './appcenter.rb'
require './version'
require 'octokit'
require 'fastlane'
require 'fastlane/runner'

# Github
def unlock_secrets_keychain(options:)
  unlock_keychain(path: "login.keychain", password: options[:password])
end

def send_build_failed_info(options:, build_info_hash:)
  build_info = BuildInfo.from_hash(build_info_hash)
  build_info.branch_name = options[:issue_name]
  build_info.issue = options[:issue_name]

  issue_name = options[:issue_name]
  branch_name = issue_name
  if issue_name.nil? || issue_name == ""
    issue_name = extract_issue_name(branch_name: branch_name)
  else
    issue_name = extract_issue_name(branch_name: issue_name)
  end
  build_info.issue_url = github_issue_url(issue: issue_name)
  telegram_chat_id = options[:telegram_chat_id]
  telegram_token = options[:telegram_token]
  action_id = options[:build_url]
  info_body = formatted_build_info_json(build_info: build_info)
  system("cd ../go_scripts && ./main build_failed #{info_body} #{telegram_chat_id} #{telegram_token} #{action_id}")
end

def get_all_github_request_builds_and_remove(options:)
  repo_owner = 'admiral-team'
  repo_name = 'admiralui-flutter'
  pull_request_number = options[:pull_request_number]
  client = Octokit::Client.new(access_token: ENV['CI_GITHUB_TOKEN'])
  comments = client.issue_comments("#{repo_owner}/#{repo_name}", pull_request_number)

  comments.each do |comment|
    if comment.user.login == 'github-actions[bot]'
      build_id_match = comment.body.match(/Build ID: (\d+)/)
      if build_id_match
        build_id = build_id_match[1]
        if comment.body.include?('Platform: Android')
          delete_build_android_from_appcenter(build_id: build_id)
        end
        if comment.body.include?('Platform: iOS')
          delete_build_ios_from_appcenter(build_id: build_id)
        end
      end
    end
  end
end

def check_close_release_issue()
  repo_owner = 'admiral-team'
  repo_name = 'admiralui-flutter'
  version = current_lib_internal_version

  client = Octokit::Client.new(access_token: ENV['CI_GITHUB_TOKEN'])

  milestone = client.list_milestones("#{repo_owner}/#{repo_name}").find { |m| m.title == version }

  if milestone.nil?
    UI.user_error!("Milestone для версии #{version} не найден.");
    return
  end

  issues = client.list_issues("#{repo_owner}/#{repo_name}", milestone: milestone.number, state: 'open');
  if issues.any?
    UI.user_error!("Ошибка: Необходимо закрыть все задачи в milestone #{version} перед выпуском.");
  end
end

def link_issue(options:)
  repo_owner = 'admiral-team'
  repo_name = 'admiralui-flutter'
  pull_request_number = options[:pull_request_number]
  issue_name = options[:issue_name]

  first_branch_part = issue_name.split("/").first
  last_branch_part = issue_name.split("/").last

  if first_branch_part == "rc"
    return
  end

  if last_branch_part.nil? || last_branch_part.empty? || last_branch_part.include?("_")
    UI.user_error!("Wrong branch name")
  end

  labels = []

  if issue_name.downcase.include?('bugfix')
    labels << "bug"
  elsif issue_name.downcase.include?('feature')
    labels << "enhancement"
  end

  issue_number = extract_issue_name(branch_name: issue_name)

  if issue_number.downcase == "tech" || issue_number.downcase == "bump"
    return
  end

  if issue_number.to_i.zero?
    UI.user_error!("No issue number from branch name")
    return
  end

  client = Octokit::Client.new(access_token: ENV['CI_GITHUB_TOKEN'])

  issue_info = client.issue("#{repo_owner}/#{repo_name}", issue_number)
  issue_description = issue_info[:body]

  pull_request_issue_info = client.issue("#{repo_owner}/#{repo_name}", pull_request_number)
  pull_request_issue_description = pull_request_issue_info[:body]

  if pull_request_issue_description.include?("# Задача")
    new_description = pull_request_issue_description.gsub("# Задача", "# Задача\n#{issue_description}\nCloses ##{issue_number}\n")
    client.update_issue("#{repo_owner}/#{repo_name}", pull_request_number, body: new_description)
    UI.success("Update issue description")
  else
    UI.error("Dont update issue description")
  end

end
