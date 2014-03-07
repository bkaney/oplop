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

  s.rubyforge_project = "oplop"

  s.add_dependency  'highline', '~> 1.6.20'

  s.add_development_dependency 'rake', '~> 10.1.1'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'yajl-ruby', '~> 1.2.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
