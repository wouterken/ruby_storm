module Storm
  class Console

    def self.reload!
      @@reload = true
      exit
    end

    def self.start(*args)
      Storm::connect
      ARGV.clear
      begin
        load Gem.bin_path('pry', 'pry')
      rescue Exception
        if @@reload
          @@reload = false
          self.start(*args)
        else
          require 'irb'
          ::IRB.start
        end
      end
    end
  end
end

class Object
  def reload!
    Storm::Console.reload!
  end
end
