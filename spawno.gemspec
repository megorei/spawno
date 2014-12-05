# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spawno/version'

Gem::Specification.new do |spec|
  spec.name          = "spawno"
  spec.version       = Spawno::VERSION
  spec.authors       = ["Dieter Pisarewski"]
  spec.email         = ["dieter.pisarewski@gmail.com"]
  spec.summary       = %q{Let rails spawn extra processes at startup.}
  spec.description   = %q{}
  spec.homepage      = "http://megorei.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
