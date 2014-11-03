require 'fileutils'

module Storm
  class Init
    def self.start(args)
      app_name = args[0]
      class_name = Inflector::classify(app_name)
      file_name = "#{Inflector::underscore(app_name)}.rb"
      dir_name = "#{Inflector::underscore(app_name)}"
      FileUtils.mkdir_p(dir_name)
      FileUtils.mkdir_p("./#{dir_name}/#{MIGRATIONS_DIR}") rescue nil

      File.open("./#{dir_name}/#{file_name}", "w+") do |f|
        f.puts "\
  class #{class_name}
    def self.main(env)
    end
  end
  "
      end

      File.open("./#{dir_name}/db/databases.yml", "w+") do |f|
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