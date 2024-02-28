require_relative 'appcenter'
require './build_info.rb'
require './utils.rb'
require './release.rb'
require './github.rb'
require './appcenter.rb'
require './version'
require 'fastlane'

# Deploy Methods

def deploy_appcenter_andoid_dev(options:, build_info_hash:)
  pull_request_url = options[:pull_request_url] || ""
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

  release_notes = "**Pull request url:** #{pull_request_url}\n\n**Branch:** #{branch_name}"

  current_directory = File.expand_path('../../../../', __FILE__)
  puts current_directory + "/example/build/app/outputs/flutter-apk/app-release.apk"

  appcenter_upload(
    api_token: ENV['APPCENTER_API_TOKEN_ANDROID_DEV'],
    owner_name: ENV['APPCENTER_OWNER_NAME'],
    owner_type: ENV['APPCENTER_OWNER_TYPE'],
    app_name: ENV['APPCENTER_APP_ANDROID_NAME_DEV'],
    file: current_directory + "/example/build/app/outputs/flutter-apk/app-release.apk",
    destinations: ENV['APPCENTER_DESTINATIONS_DEV'],
    destination_type: "group",
    release_notes: release_notes,
    notify_testers: true
  )

  build_info = BuildInfo.from_hash(build_info_hash)
  build_info.branch_name = branch_name
  build_info.platform = 'Android 🤖'
  build_info.build_url = appcenter_build_dev_url(build_id: build_info.build_id, app_name: ENV['APPCENTER_APP_ANDROID_NAME_DEV'])
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

def deploy_appcenter_dev(options:)
  skip_archive = options[:skip_archive] || false
  skip_git_comment = options[:skip_git_comment] || false
  issue_name = options[:issue_name]
  telegram_token = options[:telegram_token]
  telegram_chat_id = options[:telegram_chat_id]
  pull_request_number = options[:pull_request_number]
  build_number = generate_random_build_number()
  previous_build_number = current_app_build_number
  branch_name = issue_name

  if issue_name.nil? || issue_name == ""
    issue_name = extract_issue_name(branch_name: branch_name)
  else
    issue_name = extract_issue_name(branch_name: issue_name)
  end

  if !skip_archive
    increment_app_build(build_number: build_number)

    build_app(
      workspace: ENV['PROJECT_WORKSPACE_PATH'],
      configuration: "Release",
      scheme: "Runner",
      silent: true,
      clean: true,
      output_directory: "Release/AdmiralUI-Example/Dev",
      export_method: "enterprise",
      output_name: "admiralui-flutter-example.ipa",
    )

    increment_app_build(build_number: previous_build_number)
  end

  appcenter_upload(
    api_token: ENV['APPCENTER_API_TOKEN_IOS_DEV'],
    owner_name: ENV['APPCENTER_OWNER_NAME'],
    owner_type: ENV['APPCENTER_OWNER_TYPE'],
    app_name: ENV['APPCENTER_APP_NAME_DEV'],
    file: "Release/AdmiralUI-Example/Dev/admiralui-flutter-example.ipa",
    destinations: ENV['APPCENTER_DESTINATIONS_DEV'],
    destination_type: "group",
    release_notes: "",
    notify_testers: true
  )

  build_info_hash = lane_context[SharedValues::APPCENTER_BUILD_INFORMATION]
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
    puts "COMMENT BODY \n"
    puts comment_body
    system("cd ../go_scripts && ./main createComment #{comment_body} #{ENV['CI_GITHUB_TOKEN']} #{telegram_chat_id} #{telegram_token}")
  end
end
