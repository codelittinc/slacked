# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slacked/version'

Gem::Specification.new do |spec|
  spec.name          = "slacked"
  spec.version       = Slacked::VERSION
  spec.authors       = ["Sean", "Kaio Magalhães", "Locky"]
  spec.email         = ["seathony@gmail.com"]

  spec.summary       = %q{A super simple and easy way to send notifications to Slack from your Rails application.}
  spec.description   = %q{This is a super simple Slack integration for Rails. A use case for this would be to post
                          a notification in Slack when a new User is created or a certain action has been taken in
                          your application.
                          Are there other gems that provide similar functionality? Yes. Do some of them provide more
                          flexibility? Yes. The point of this was to make installing and integrating a 30 second process.}

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

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-mocks'

  spec.add_dependency 'slack-notifier'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'thor'
  spec.add_dependency 'httparty'
end
