require 'fileutils'

module Storm
  class Start
    def self.start(args)

      Storm.load_environment

      project_name = File.basename(Dir.pwd)
      puts "Loading project [#{project_name}]"

      class_name = Inflector::classify(project_name)
      Inflector::constantize(class_name).main(STORM_ENV, ARGV[1..-1])
    end
  end
end

