module Storm
  module Db
    class Drop < Storm::DBCommand
      def self.start(args)
        ActiveRecord::Base.connection.drop_database self.connect['database']
      end
    end
  end
end