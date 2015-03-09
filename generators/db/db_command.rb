class Storm::DBCommand
  require 'active_record'
  require 'yaml'
  def self.config
    @config ||= ::YAML.load_file('./db/databases.yml')[Storm::STORM_ENV]
  end

  def self.connect
    self.config
    ::ActiveRecord::Base.establish_connection self.config
    ::ActiveRecord::Base.logger = Logger.new STDOUT if @config['logger']
  end
end