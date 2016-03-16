# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flub/version'

Gem::Specification.new do |spec|
  spec.name          = "flub"
  spec.version       = Flub::VERSION
  spec.authors       = ["Frans Krojegård"]
  spec.email         = ["frans@krojegard.com"]
  spec.summary       = %q{Simple error recipient for centralizing error logging in an app}
  spec.description   = %q{Simple error recipient for centralizing error logging in an app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
