# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hark/version"

Gem::Specification.new do |s|
  s.name        = "hark"
  s.version     = Hark::VERSION
  s.authors     = ["Mike Mondragon", "Wes Maldonado"]
  s.email       = ["mikemondragon@gmail.com", "wes@brokenbuild.com"]
  s.homepage    = "http://www.hark.com/"
  s.summary     = %q{A Ruby Gem to access the hark.com API}
  s.description = %q{hark.com is a site that publishes movie quote sound bites
                     and still images.  This gem is used to access this
                     information in a programatic fashion.}

  s.rubyforge_project = "hark"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "activesupport"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "yard"
  s.add_development_dependency "rdiscount"
end
