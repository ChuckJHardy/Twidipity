source 'https://rubygems.org'

ruby '2.1.5'

# Environment
gem 'rails', '4.1.7'
gem 'pg', '~> 0.17'
gem 'unicorn', '~> 4.8'
gem 'envied', '~> 0.8'

# Assets
gem 'sass-rails', '~> 4.0'
gem 'sprockets-rails', '~> 2.2'
gem 'uglifier', '~> 1.3'
gem 'coffee-rails', '~> 4.0'
gem 'therubyracer', '~> 0.12', platforms: :ruby
gem 'jquery-rails', '~> 3.1'
gem 'turbolinks', '~> 2.5'
gem 'normalize-rails', '~> 3.0.1'

# Docs
gem 'sdoc', group: :doc

# API's
gem 'gibbon', '~> 1.1'
gem 'omniauth-twitter', '~> 1.1'

# Tools
gem 'newrelic_rpm', '~> 3.9.6'
gem 'skylight', '~> 0.4'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'rubocop', require: false
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
end
