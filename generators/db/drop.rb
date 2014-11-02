module Db
  class Drop
    def self.start(args)
      `rake db:drop`
    end
  end
end