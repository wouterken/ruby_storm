require "./generators/db/migration_generator"

module Db
  class Migrate
    self.connect
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, VERSION.to_i
  end
end