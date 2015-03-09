require_relative "db_command"

module Storm::Db
  class Rollback < Storm::DBCommand
    def self.start (*args)
      self.connect
      step = ENV['STEP'] ? ENV['STEP'].to_i : 1
      ::ActiveRecord::Migrator.rollback ::Storm::MIGRATIONS_DIR, step
    end
  end
end