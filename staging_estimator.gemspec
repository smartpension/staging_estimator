# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staging_estimator/version'

Gem::Specification.new do |spec|
  spec.name          = "staging_estimator"
  spec.version       = StagingEstimator::VERSION
  spec.authors       = ["Anthony Laibe"]
  spec.email         = ["anthony@smartpension.co.uk"]

  spec.summary       = %q{Staging date estimator}
  spec.description   = %q{Staging date estimator based on employee count PAYE}
  spec.homepage      = "https://github.com/smartpension/staging_estimator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

