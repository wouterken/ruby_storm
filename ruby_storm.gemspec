require './generators/version'

Gem::Specification.new do |s|
  s.name        = 'ruby_storm'
  s.version     = Storm::Version.to_s
  s.date        = '2014-11-02'
  s.summary     = "Ruby storm is a stand alone Object Relational Mapper"
  s.description = "Ruby storm is a stand alone Object Relational Mapper that wraps ActiveRecord."
  s.authors     = ["Wouter Coppieters"]
  s.email       = 'wouter.coppieters@youdo.co.nz'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_runtime_dependency 'pry'
  s.add_runtime_dependency 'jazz_hands'
  s.add_runtime_dependency 'awesome_print'
  s.add_runtime_dependency 'activerecord'
  s.add_runtime_dependency 'sqlite3'
  s.add_runtime_dependency 'thread_safe'
  s.add_runtime_dependency 'bundler'

  s.homepage    = 'http://rubygems.org/gems/ruby_storm'
  s.license     = 'MIT'
end