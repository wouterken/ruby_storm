module Storm
  class Console

    def self.reload!
      @@reload = true
      exit
    end

    def self.start(*args)
      reload_proc = proc{ Storm::Console.start(*args) }

      require 'thread_safe'
      require 'active_record'
      require "awesome_print"
      require 'bundler'

      ::Bundler.require(:default, :development)
      Dir["./**/*.rb"].each{|file| next if /db\/migrate/ =~ file; require file }

      require File.expand_path("./../../application/inflector", __FILE__)
      require File.expand_path("./../../application/application", __FILE__)

      ActiveRecord::Base.establish_connection YAML.load_file('./db/databases.yml')[Storm::STORM_ENV] rescue nil
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
          puts e
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
