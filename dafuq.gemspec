# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dafuq/version'

Gem::Specification.new do |gem|
  gem.name          = "dafuq"
  gem.version       = Dafuq::VERSION
  gem.authors       = ["AbhishekKr"]
  gem.email         = ["abhikumar163@gmail.com"]
  gem.description   = %q{dafuq is here to handle dafuq tasks required now and then, sometimes and often}
  gem.summary       = %q{dafuq is this, said a lot... will be adding some of the solutions to it over time}
  gem.homepage      = "https://github.com/abhishekkr/dafuq"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.executables   = %w( dafuq )

  gem.add_runtime_dependency 'arg0', '>= 0.0.2'
end
