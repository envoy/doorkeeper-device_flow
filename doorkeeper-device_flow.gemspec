# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doorkeeper/device_flow/version'

Gem::Specification.new do |spec|
  spec.name          = "doorkeeper-device_flow"
  spec.version       = Doorkeeper::DeviceFlow::VERSION
  spec.authors       = ["Kamal Fariz Mahyuddin", "Matthew Johnston"]
  spec.email         = ["kamal.fariz@gmail.com", "warmwaffles@gmail.com"]

  spec.summary       = %q{Adds device authorization token functionality to doorkeeper}
  spec.description   = %q{Adds device authorization token functionality to doorkeeper}
  spec.homepage      = "https://github.com/envoy/doorkeeper-device_flow"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "doorkeeper", ">= 3.0"
end
