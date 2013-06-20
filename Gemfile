source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'thin'
gem 'pg'
gem 'activerecord-postgres-hstore'
gem 'friendly_id', '~> 4.0.9'
gem 'postgres_ext', '~> 0.2.2', require: 'postgres_ext'
gem 'dalli', '~> 2.6.2'
gem 'tire', '~> 0.5.7'
gem 'settingslogic', '~> 2.0.8'
gem 'rabl', '~> 0.8.4'
gem 'oj', '~> 2.0.2'
gem 'foreman', '~> 0.57.0'

#
# Authentication
#

gem 'omniauth', '~> 1.1'
gem 'omniauth-github', '~> 1.1'

group :assets do
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.2.7'
  gem 'zurb-foundation', github: 'zurb/foundation'
  gem 'jquery-ui-rails', github: 'rahilsondhi/jquery-ui-rails'
  gem 'handlebars_assets', '~> 0.12'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller' # This is for better_errors
  gem 'heroku_san'
  gem 'annotate'
  gem 'pry-rails'
end

group :test do
  # Testing
  gem 'rspec-rails'
  gem 'shoulda', github: 'thoughtbot/shoulda'
  gem 'database_cleaner'

  # Guard related stuff
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-zeus'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
end

group :development, :test do
  gem 'fabrication'
  gem 'faker'
  gem 'dotenv-rails', '~> 0.7'
end