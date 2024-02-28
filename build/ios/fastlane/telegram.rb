require './build_info.rb'
require './utils.rb'
require './release.rb'
require './github.rb'
require './appcenter.rb'
require './version'

# Telegram Methods

def send_ios_telegram_message(options:, build_info_hash:)
  skip_git_comment = options[:skip_git_comment] || false
  issue_name = options[:issue_name]
  telegram_token = options[:telegram_token]
  telegram_chat_id = options[:telegram_chat_id]
  pull_request_number = options[:pull_request_number]
  branch_name = issue_name

  if issue_name.nil? || issue_name == ""
    issue_name = extract_issue_name(branch_name: branch_name)
  else
    issue_name = extract_issue_name(branch_name: issue_name)
  end

  build_info = BuildInfo.from_hash(build_info_hash)
  build_info.branch_name = branch_name
  build_info.platform = 'iOS 🍏'
  build_info.build_url = appcenter_build_dev_url(build_id: build_info.build_id, app_name: ENV['APPCENTER_APP_NAME_DEV'])
  build_info.internal_version = current_lib_internal_version
  build_info.external_version = current_lib_external_version
  build_info.issue = issue_name
  build_info.issue_url = github_issue_url(issue: issue_name)
  build_info.pull_request_number = pull_request_number

  if !skip_git_comment && !issue_name.nil?
    comment_body = formatted_build_info_json(build_info: build_info)
    puts "comment_body"
    puts comment_body
    system("cd ../go_scripts && ./main createComment #{comment_body} #{ENV['CI_GITHUB_TOKEN']} #{telegram_chat_id} #{telegram_token}")
  end
end
