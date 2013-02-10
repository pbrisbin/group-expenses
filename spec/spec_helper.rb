require 'active_support/core_ext'
require 'active_support/dependencies'

%w( lib app/models ).each do |dir|
  $LOAD_PATH << dir
  ActiveSupport::Dependencies.autoload_paths << dir
end
