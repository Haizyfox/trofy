source 'https://rubygems.org'

ruby "2.0.0"

# View Models for Rails
gem "draper"

# HTTP client that provides a common interface over many adapters
gem "faraday", require: false

# HTML Abstraction Markup Language
gem "haml-rails"

# Create JSON structures via Builder-style DSL.
gem "jbuilder"

# preview email templates in the browser
gem "mail_view", "~> 1.0.3"

# Postgres
gem "pg"

# Ruby on Rails
gem "rails"

# Simple Rails configuration
gem "rails_config"

# Taint/permit/require parameters passed from controller to model.
gem "strong_parameters"

# Email validation
gem "validates_email_format_of", require: false

# URL validation
gem "validate_url", require: false


group :assets do

  #Adapter for the Compass Stylesheet Authoring Framework
  gem 'compass-rails'

  # Make HAML available to asset pipeline
  gem 'haml_assets'

  # Sass adapter for the Rails asset pipeline.
  gem 'sass-rails',   '~> 3.2.3'

  # CoffeeScript adapter for the Rails asset pipeline.
  gem 'coffee-rails', '~> 3.2.1'

  # Ruby wrapper for UglifyJS JavaScript compressor
  gem 'uglifier', '>= 1.0.3'

  # SASS version of Twitter bootstrap.
  gem 'bootstrap-sass', '~> 2.1.1.0'

  # underscore.js for the Rails asset pipeline
  gem 'underscore-rails'

  # Javascript runtime
  gem 'therubyracer'

  #Jquery
  gem 'jquery-rails'

end

group :development do

  # Less asset pipeline spam in logs
  gem "quiet_assets"

end

group :development, :test do

  # RSpec: testing framework.
  gem "rspec-rails"

end

group :test do

  # Factory girl - easily create new models
  gem "factory_girl_rails"

  # Declaritive JSON matching
  gem "json_expressions"

  # Freeze and or adjust time
  gem "timecop"

  # Record and playback http requests
  gem "vcr", require: false

  # Stub and set expectations on HTTP requests.
  gem "webmock"

end

group :production do

  # HTTP server with Rack interface.
  gem "unicorn"

end
