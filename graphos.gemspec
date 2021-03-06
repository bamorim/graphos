# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphos/version'

Gem::Specification.new do |spec|
  spec.name          = "graphos"
  spec.version       = Graphos::VERSION
  spec.authors       = ["Bernardo Amorim", "Pedro Volpi"]
  spec.email         = ["contato@bamorim.com", "pedrovolpi@poli.ufrj.br"]
  spec.summary       = %q{Educational gem to Graph Theory @ UFRJ}
  spec.description   = %q{This gems implements some graph algorithms and representations.}
  spec.homepage      = "https://github.com/bamorim/graphos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.4"
  spec.add_development_dependency "minitest-reporters", "~> 1.0"
  spec.add_development_dependency "pry", "~>0.10"
end
