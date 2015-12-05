# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slacked/version'

Gem::Specification.new do |spec|
  spec.name          = "slacked"
  spec.version       = Slacked::VERSION
  spec.authors       = ["sean"]
  spec.email         = ["seathony@gmail.com"]

  spec.summary       = %q{Notify slack when an action has been completed.}
  spec.description   = %q{Notify slack when an action has been completed.}
  spec.homepage      = "https://github.com/codelittinc/slacked"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-mocks'

  spec.add_dependency 'slack-notifier'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'thor'
  spec.add_dependency 'httparty'
end
