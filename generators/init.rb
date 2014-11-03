require 'fileutils'

module Storm
  class Init
    def self.start(args)
      app_name = args[0]
      class_name = Inflector::classify(app_name)
      file_name = "#{Inflector::underscore(app_name)}.rb"
      dir_name = "#{Inflector::underscore(app_name)}"
      FileUtils.mkdir_p(dir_name)
      File.open("./#{dir_name}/#{file_name}", "w+") do |f|
        f.puts "\
  class #{class_name}
    def self.main(env)
    end
  end
  "
        FileUtils.mkdir_p("./#{dir_name}/#{MIGRATIONS_DIR}") rescue nil
      end
    end
  end
end