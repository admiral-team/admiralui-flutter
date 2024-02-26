require './build_info.rb'
require './utils.rb'
require './version.rb'

# Supporting Methods

def increment_app_version(options:)
  version_number = options[:version_number]
  increment_version_number(
    version_number: version_number,
    xcodeproj: ENV['LIBRARY_PROJECT_PATH']
  )
end

def increment_app_build(options:)
  build_number = options[:build_number]
  increment_build_number(
    build_number: build_number,
    xcodeproj: ENV['LIBRARY_PROJECT_PATH']
  )
end

def set_version(options:)
  internal = options[:internal_version]
  external = options[:external_version]
  update_app_version = options[:update_app_version]

  set_version(
    external_version: external,
    internal_version: internal
  )

  if update_app_version
    increment_app_version(version_number: current_lib_external_version)
  end
end

def finish_release_version(options:)
  external = options[:external_version]
  last_version = options[:version_number]
  internal = current_lib_internal_version
  set_version(
    external_version: external,
    internal_version: internal,
  )
  if !last_version.nil? && !last_version.empty?
    increment_app_version(version_number: last_version)
  end
end

def start_next_release_version(options:)
  external = "0.0.0"
  internal = "#{Integer(current_lib_internal_version) + 1}"
  set_version(external_version: external, internal_version: internal)
  increment_app_version(version_number: external)
end
