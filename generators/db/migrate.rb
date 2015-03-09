require_relative "db_command"

module Storm::Db
  class Migrate < Storm::DBCommand
    def self.start *_
      self.connect
      ::ActiveRecord::Migration.verbose = true
      ::ActiveRecord::Migrator.migrate File.expand_path(Storm::MIGRATIONS_DIR), Storm::DB_VERSION && Storm::DB_VERSION.to_i
    end
  end
end
