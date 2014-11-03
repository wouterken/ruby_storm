module Storm::Db
  class Rollback < Storm::DBCommand
    def start (*args)
      self.connect
      step = ENV['STEP'] ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
    end
  end
end