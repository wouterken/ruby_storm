require 'fileutils'

module Storm
  class App
    def self.start(args)
      Storm::connect
      project_name = File.basename(Dir.pwd)
      class_name = Inflector::classify(project_name.gsub("-","_"))
      Inflector::constantize(class_name).send(ARGV[1], ARGV[2..-1])
    end
  end
end

