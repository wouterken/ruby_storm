require 'fileutils'

class Init
  def self.start(app_name)
    class_name = Inflector::classify(app_name)
    file_name = "#{Inflector::underscore(app_name)}.rb"
    File.open("./#{file_name}", "w+") do |f|
      f.puts "\
class #{class_name}
  def self.main(env)
  end
end
"
    end
  end
end