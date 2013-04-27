source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'thin'
gem 'pg'
gem 'activerecord-postgres-hstore'
gem 'friendly_id', '~> 4.0.9'
gem 'postgres_ext', '~> 0.2.2', require: 'postgres_ext'
gem 'dalli', '~> 2.6.2'
gem 'tire', '~> 0.5.4'
gem 'settingslogic', '~> 2.0.8'
gem 'rabl', '~> 0.7.9'
gem 'oj', '~> 2.0.2'
gem 'foreman', '~> 0.57.0'

group :assets do
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.2.7'
  gem 'handlebars_assets', '~> 0.6.4'
  gem 'zurb-foundation', github: 'zurb/foundation'
  gem 'jquery-ui-rails', github: 'rahilsondhi/jquery-ui-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller' # This is for better_errors
  gem 'heroku_san'
  gem 'annotate'
end

group :test do
  # Testing
  gem 'rspec-rails'
  gem 'shoulda', '~> 2.0'
  gem 'fabrication'

  # Guard related stuff
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-zeus'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
end
