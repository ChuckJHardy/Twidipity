source 'https://rubygems.org'

ruby '2.1.5'

# Environment
gem 'rails', '4.1.8'
gem 'pg', '~> 0.17'
gem 'unicorn', '~> 4.8'
gem 'envied', '~> 0.8'
gem 'sidekiq', '~> 3.2'
gem "clockwork", "~> 0.7", require: false

# Assets
gem 'sass-rails', '~> 4.0'
gem 'sprockets-rails', '~> 2.2'
gem 'uglifier', '~> 1.3'
gem 'coffee-rails', '~> 4.0'
gem 'therubyracer', '~> 0.12', platforms: :ruby
gem 'jquery-rails', '~> 3.1'
gem 'turbolinks', '~> 2.5'
gem 'normalize-rails', '~> 3.0.1'
gem 'bootstrap-sass', '~> 3.3'
gem 'bourbon'

# Docs
gem 'sdoc', group: :doc

# API's
gem 'gibbon', '~> 1.1'
gem 'omniauth-twitter', '~> 1.1'
gem 'twitter', '~> 5.13'

# Tools
gem 'newrelic_rpm', '~> 3.9.6'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'rubocop', require: false

  gem 'capistrano-rails'
  gem 'capistrano-rvm'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'launchy'
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'daemons', '~> 1.1.9'
end
