require "./generators/db/migration_generator"
module Storm
  module Db
    class Migrate < Storm::DBCommand
      self.connect
      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.migrate MIGRATIONS_DIR, VERSION.to_i
    end
  end
end