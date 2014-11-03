require './lib/ruby_storm'

Gem::Specification.new do |s|
  s.name        = 'ruby_storm'
  s.version     = RubyStorm::VERSION
  s.date        = '2014-11-02'
  s.executables = ['storm', 'stormc']
  s.summary     = "Ruby storm is a stand alone Object Relational Mapper"
  s.description = "Ruby storm is a stand alone Object Relational Mapper that wraps ActiveRecord."
  s.authors     = ["Wouter Coppieters"]
  s.email       = 'wouter.coppieters@youdo.co.nz'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.homepage    = 'http://rubygems.org/gems/ruby_storm'
  s.license     = 'MIT'
end