require 'dotenv'

# Appcenter
def delete_build_from_appcenter(build_id:, app_name:, api_token:)
  owner_name = ENV['APPCENTER_OWNER_NAME']
  command = "curl -X DELETE -H 'Content-Type: application/json' -H 'X-API-Token: #{api_token}' 'https://api.appcenter.ms/v0.1/apps/#{owner_name}/#{app_name}/releases/#{build_id}'"
  system(command)
end
