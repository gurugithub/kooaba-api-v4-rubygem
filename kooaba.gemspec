# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kooaba/version"

Gem::Specification.new do |s|
  s.name        = "kooaba"
  s.version     = Kooaba::VERSION
  s.authors     = ["Cristi Prodan"]
  s.email       = ["prodan@kooaba.com"]
  s.homepage    = "https://github.com/kooaba/kooaba-ruby"
  s.summary     = %q{A gem for accessing the kooaba APIs}
  s.description = %q{A lightweight gem for accessing the kooaba APIs. For more information on the APIs check out http://kooaba.github.com}

  s.rubyforge_project = "kooaba"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
