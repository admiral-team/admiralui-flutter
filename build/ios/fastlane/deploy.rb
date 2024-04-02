require_relative 'appcenter'
require './build_info.rb'
require './utils.rb'
require './release.rb'
require './github.rb'
require './appcenter.rb'
require './version'
require 'fastlane'
require 'octokit'

# Deploy Methods

def deploy_appcenter_andoid_dev(options:)
  pull_request_url = options[:pull_request_url] || ""
  branch_name = options[:issue_name]

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
end

def deploy_appcenter_dev(options:)
  skip_archive = options[:skip_archive] || false
  issue_name = options[:issue_name]
  previous_build_number = current_app_build_number
  build_number = generate_random_build_number()
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
end
