# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "oplop/version"

Gem::Specification.new do |s|
  s.name        = "oplop"
  s.version     = Oplop::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Kaney"]
  s.email       = ["brian@vermonster.com"]
  s.homepage    = "http://github.com/bkaney/oplop"
  s.summary     = %q{Oplop for Ruby}
  s.description = %q{Provides a ruby library and command line tool for Oplop}
  s.license     = 'MIT'

  s.rubyforge_project = "oplop"

  s.add_dependency  'highline', '~> 2.0'

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.11'
  s.add_development_dependency 'yajl-ruby', '~> 1.4'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
