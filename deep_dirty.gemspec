# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_dirty/version'

Gem::Specification.new do |spec|
  spec.name          = "deep_dirty"
  spec.version       = DeepDirty::VERSION
  spec.authors       = ["Laas Toom"]
  spec.email         = ["laas.toom@gmail.com"]
  spec.summary       = %q{Dirty tracking that supports destructive changes}
  spec.description   = %q{An ActiveRecord::Concern that fixes dirty tracking for destructive or in-place changes
   by adding a `before_validation` hook that compares current value to that of `before_type_cast` and forces changes if needed.}
  spec.homepage      = "https://github.com/borgand/deep_dirty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "activemodel", ">= 3.0.0"
  spec.add_development_dependency "activesupport", ">= 3.0.0"

  spec.add_runtime_dependency "activemodel", ">= 3.0.0"
  spec.add_runtime_dependency "activesupport", ">= 3.0.0"
end
