class Storm::DBCommand
  def self.config
    @config ||= YAML.load_file('./db/databases.yml')[DATABASE_ENV]
  end

  def self.connect
    ActiveRecord::Base.establish_connection self.config
    ActiveRecord::Base.logger = Logger.new STDOUT if @config['logger']
    self.config
  end
end