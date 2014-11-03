module Db
  class Version < DBCommand
    def start(*args)
      puts "Current version: #{ActiveRecord::Migrator.current_version}"
    end
  end
end