require_relative "db_command"

module Storm::Db
  class Seed < Storm::DBCommand
    def self.start (*args)
      Dir["./db/seed*.rb"].each do |file| require file end
    end
  end
end