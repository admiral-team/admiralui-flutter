require 'dotenv'

# Appcenter

def delete_build_android_from_appcenter(build_id:)
    app_name = ENV['APPCENTER_APP_ANDROID_NAME_DEV']
    owner_name = ENV['APPCENTER_OWNER_NAME']
    api_token = ENV['APPCENTER_API_TOKEN_ANDROID_DEV']
    command = "curl -X DELETE -H 'Content-Type: application/json' -H 'X-API-Token: #{api_token}' 'https://api.appcenter.ms/v0.1/apps/#{owner_name}/#{app_name}/releases/#{build_id}'"
    system(command)
end
  
def delete_build_ios_from_appcenter(build_id:)
    app_name = ENV['APPCENTER_APP_NAME_DEV']
    owner_name = ENV['APPCENTER_OWNER_NAME']
    api_token = ENV['APPCENTER_API_TOKEN_IOS_DEV']
    command = "curl -X DELETE -H 'Content-Type: application/json' -H 'X-API-Token: #{api_token}' 'https://api.appcenter.ms/v0.1/apps/#{owner_name}/#{app_name}/releases/#{build_id}'"  
    system(command)
end