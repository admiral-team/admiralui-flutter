require './build_info.rb'
require './utils.rb'
require './release.rb'
require './github.rb'
require './appcenter.rb'
require './version'

# Telegram Methods
def build_remote_demo(options:)
  issue_name = options[:issue_name]
  branch_name = issue_name
  if !issue_name.nil?
    system("cd ../go_scripts && ./main change_remote_project_branch #{branch_name}")
  end
end
