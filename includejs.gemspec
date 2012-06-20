# -*- encoding: utf-8 -*-
require File.expand_path('../lib/includejs/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mark Bates"]
  gem.email         = ["mark@markbates.com"]
  gem.description   = %q{Adds the ability to include Modules into JavaScript objects}
  gem.summary       = %q{Adds the ability to include Modules into JavaScript objects}
  gem.homepage      = "https://github.com/markbates/includejs"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "includejs"
  gem.require_paths = ["lib"]
  gem.version       = Includejs::VERSION

  gem.add_development_dependency("rake")
  gem.add_development_dependency("growl")
  gem.add_development_dependency("guard")
  gem.add_development_dependency("guard-coffeescript")
  gem.add_development_dependency("guard-jasmine-headless-webkit")
  gem.add_development_dependency("jasmine")
  gem.add_development_dependency("jasmine-headless-webkit")
end
