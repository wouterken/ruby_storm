require_relative "db_command"

module Storm::Db
  class Drop < Storm::DBCommand
    def self.start(args)
      case self.config['adapter']
      when 'sqlite3'
        db_file = File.expand_path("./"+self.config['database'])
        return File.delete(db_file)
      when 'postgresql'
        ::ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres', 'schema_search_path' => 'public'))
      end
      ::ActiveRecord::Base.connection.drop_database self.config['database'] rescue nil
    end
  end
end
