# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_dirty/version'

Gem::Specification.new do |spec|
  spec.name          = "deep_dirty"
  spec.version       = DeepDirty::VERSION
  spec.authors       = ["Laas Toom"]
  spec.email         = ["laas.toom@gmail.com"]
  spec.summary       = %q{Dirty tracking that supports implicit changes (e.g. upcase! etc)}
  spec.description   = %q{Deep dirty checking that compares every attribute to it's value before type cast
    and marks all changes detected as changed attributes. This makes possible detecting `user.name.upcase!`
    and similar implicit changes.

    To make it automatic on `save`, including this module sets up a `before_validation` callback.
  }
  spec.homepage      = "https://github.com/borgand/deep_dirty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "activemodel", ">= 3.0.0"
end
