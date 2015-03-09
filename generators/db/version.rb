require "#{Storm::STORM_DIR}/generators/db/db_command"

module Storm::Db
  class Version < Storm::DBCommand
    def self.start(*args)
      self.connect
      puts "Current version: #{::ActiveRecord::Migrator.current_version}"
    end
  end
end