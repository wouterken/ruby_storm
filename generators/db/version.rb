module Storm::Db
  class Version < Storm::DBCommand
    def start(*args)
      puts "Current version: #{::ActiveRecord::Migrator.current_version}"
    end
  end
end