require "#{Storm::STORM_DIR}/generators/db/db_command"

module Storm::Db
  class Migrate < Storm::DBCommand
    def self.start *_
      self.connect
      ::ActiveRecord::Migration.verbose = true
      ::ActiveRecord::Migrator.migrate File.expand_path(Storm::MIGRATIONS_DIR), Storm::VERSION && Storm::VERSION.to_i
    end
  end
end
