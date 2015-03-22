module Storm
  class Console

    def self.reload!
      @@reload = true
      exit
    end

    def self.start(*args)
      ActiveRecord::Base.establish_connection YAML.load_file('./db/database.yml')[Storm::STORM_ENV]
      ARGV.clear
      begin
        require 'pry'
        Pry.color = true
        Pry.config.print = proc { |output, value| output.puts "=> #{value.ai}" }
        load Gem.bin_path('pry', 'pry')
      rescue Exception => e
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
