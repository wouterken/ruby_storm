require "#{Storm::STORM_DIR}/generators/db/db_command"

module Storm::Db
  class Drop < Storm::DBCommand
    def self.start(args)
      ::ActiveRecord::Base.connection.drop_database self.connect['database'] rescue
      if self.config['adapter'] == 'sqlite3'
        db_file = File.expand_path("./"+self.config['database'])
        File.delete(db_file)
      end
    end
  end
end
