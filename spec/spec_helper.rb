# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  # From RailsCast #413
  # http://railscasts.com/episodes/413-fast-tests
  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all) { DeferredGarbageCollection.reconsider }

  # DatabaseCleaner
  # https://github.com/bmabey/database_cleaner
  # Disabled for now to increase speed. Not sure if I really need this.
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  # config.before(:each) { DatabaseCleaner.start }
  # config.after(:each) { DatabaseCleaner.clean }
end

# Fabrication
# http://www.fabricationgem.org/#!configuration
Fabrication.configure do |config|
  config.fabricator_path = 'spec/fabricators'
end
