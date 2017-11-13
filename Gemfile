source 'https://rubygems.org'

# Declare your gem's dependencies in new_relic_ping.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

group :development, :test do
  gem 'appraisal'
  gem 'pry'
  # for CRuby, Rubinius, including Windows and RubyInstaller
  gem 'sqlite3', :platform => [:ruby, :mswin, :mingw]
end

# jquery-rails is used by the dummy application
gem 'jquery-rails'
