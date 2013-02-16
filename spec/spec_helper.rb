require 'active_support/core_ext'
require 'active_support/dependencies'

%w( lib app/models ).each do |dir|
  $LOAD_PATH << dir
  ActiveSupport::Dependencies.autoload_paths << dir
end

module ActiveRecord
  class Base
    def self.has_many(*); end
    def self.belongs_to(*); end
    def self.has_and_belongs_to_many(*); end
  end
end
