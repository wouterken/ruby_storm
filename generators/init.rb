require 'fileutils'

module Storm
  class Init
    def self.start(args)
      app_name   = args[0]
      class_name = Inflector::classify(app_name)
      dir_name   = Inflector::underscore(app_name)
      file_name  = "#{Inflector::underscore(app_name)}.rb"

      FileUtils.mkdir_p(dir_name)
      FileUtils.mkdir_p("./#{dir_name}/#{MIGRATIONS_DIR}") rescue nil
      gemfile(dir_name)
      appfile(dir_name, file_name, class_name)
      dbfile(dir_name)
    end

    #
    # Write project Gemfile
    #
    def self.gemfile(dir_name)
  File.open("./#{dir_name}/Gemfile", "w+") do |f|
    f.puts "\
source 'https://rubygems.org'
gem 'ruby_storm'
"
      end
    end

    #
    # Write app entry point
    #
    def self.appfile(dir_name, file_name, class_name)
      File.open("./#{dir_name}/#{file_name}", "w+") do |f|
        f.puts "\
class #{class_name}
  def self.main(env, args)
  end
end
  "
      end
    end

    #
    # Write database.yml
    #
    def self.dbfile(dir_name)
      File.open("./#{dir_name}/db/database.yml", "w+") do |f|
        f.puts "\
default: &default
  adapter: sqlite3
  pool: 5
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3
  "
      end
    end
  end
end

