require_relative "db_command"
require_relative "create"
require_relative "migrate"
require_relative "seed"

module Storm::Db
  class Reset < Storm::DBCommand
    def self.start (*args)
      Storm::Db::Create.start(*args)
      Storm::Db::Migrate.start(*args)
      Storm::Db::Seed.start(*args)
    end
  end
end