module Db
  class Create
    def self.start(args)
      `rake db:create`
    end
  end
end