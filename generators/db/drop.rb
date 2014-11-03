module Db
  class Drop < DBCommand
    def self.start(args)
      ActiveRecord::Base.connection.drop_database self.connect['database']
    end
  end
end