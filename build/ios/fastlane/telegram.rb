require './build_info.rb'
require './utils.rb'
require './release.rb'
require './github.rb'
require './appcenter.rb'
require './version'

# Telegram Methods
def send_telegram_message(options:, release:, platform:, app_name:)
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

  build_info = BuildInfo()
  build_info.branch_name = branch_name
  build_info.platform = platform
  build_info.build_url = release[:binaryDownloadUri]
  build_info.internal_version = current_lib_internal_version
  build_info.external_version = current_lib_external_version
  build_info.issue = issue_name
  build_info.issue_url = github_issue_url(issue: issue_name)
  build_info.pull_request_number = pull_request_number

  if !issue_name.nil?
    comment_body = formatted_build_info_json(build_info: build_info)
    system("cd ../go_scripts && ./main createComment #{comment_body} #{ENV['CI_GITHUB_TOKEN']} #{telegram_chat_id} #{telegram_token}")
  end
end
