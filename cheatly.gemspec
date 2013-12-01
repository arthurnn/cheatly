# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cheatly/version'

Gem::Specification.new do |spec|
  spec.name          = "cheatly"
  spec.version       = Cheatly::VERSION
  spec.authors       = ["Arthur Neves"]
  spec.email         = ["arthurnn@gmail.com"]
  spec.description   = %q{A cheat-sheet cli for a cheat repository}
  spec.summary       = %q{A cheat-sheet cli for a cheat repository}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.12.0"
  spec.add_dependency "pager", "~> 1.0.1"
  spec.add_dependency "redcarpet", "~> 3.0.0"
  spec.add_dependency "colorize", "~> 0.6.0"
  spec.add_dependency "thor", "~> 0.18.1"

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.8"
end
