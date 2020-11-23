# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-channel_advisor/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-channel_advisor"
  spec.version       = OmniAuth::ChannelAdvisor::VERSION
  spec.authors       = ["ShippingEasy"]
  spec.email         = ["joshua@shippingeasy.com"]
  spec.summary       = %q{ChannelAdvisor OAuth2 strategy for OmniAuth}
  spec.homepage      = "https://github.com/ShippingEasy/omniauth-channel_advisor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.5'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
