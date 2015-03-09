require 'fileutils'

module Storm
  class Start
    def self.start(args)
      require 'thread_safe'
      require 'active_record'
      require "awesome_print"
      require 'bundler'
      ::Bundler.require(:default, :development)
      Dir["./**/*.rb"].each{|file| next if /db\/migrate/ =~ file; require file }
      project_name = File.basename(Dir.pwd)
      class_name = Inflector::classify(project_name)
      Inflector::constantize(class_name).main(STORM_ENV, ARGV[1..-1])
    end
  end
end

