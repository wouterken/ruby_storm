require 'fileutils'

module Storm
  class App
    def self.start(args)
      require 'thread_safe'
      require 'active_record'
      require "awesome_print"
      require 'bundler'
      ::Bundler.require(:default, :development)
      Dir["./**/*.rb"].each{|file| next if /db\/migrate/ =~ file; require file }
      project_name = File.basename(Dir.pwd)
      class_name = Inflector::classify(project_name)
      Inflector::constantize(class_name).send(ARGV[1], ARGV[2..-1])
    end
  end
end

