# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartbeat_rails/version'

Gem::Specification.new do |spec|
  spec.name = 'heartbeat_rails'
  spec.version = HeartbeatRails::VERSION
  spec.authors = ['Jeremy Olliver', 'Fabio Napoleoni']
  spec.email = %w(jeremy.olliver@gmail.com f.napoleoni@gmail.com)

  spec.summary = %q{Rails endpoint for NewRelic HTTP ping monitoring}
  spec.description = %q{Provides endpoints for NewRelic (or any other uptime service monitor) HTTP ping monitoring for Rails applications}
  spec.homepage = 'https://github.com/fabn/heartbeat_rails'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Relaxed version constraint, we don't want to be a barrier to upgrading
  spec.add_dependency 'rails', '>= 3.2'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
end
