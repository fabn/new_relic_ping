$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'heartbeat_rails'

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'
# require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.verbose = false