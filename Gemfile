source "https://rubygems.org"

# Environment
gem "rails", "4.1.7"
gem "pg"
gem "unicorn"
gem "envied"

# Assets
gem "sass-rails", "~> 4.0"
gem "sprockets-rails", "~> 2.2"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "therubyracer",  platforms: :ruby
gem "jquery-rails"
gem "turbolinks"
gem "normalize-rails"

# Docs
gem "sdoc", group: :doc

# API"s
gem "gibbon", "~> 1.1"

# Tools
gem "newrelic_rpm", "~> 3.9.6"

group :development do
  gem "foreman"
  gem "spring"
end

group :development, :test do
  gem "rspec-rails"
end

group :test do
  gem "cucumber-rails", require: false
  gem "launchy"
  gem "database_cleaner"
  gem "vcr"
  gem "webmock"
end

group :production do
  gem "rails_12factor"
end

ruby "2.1.5"
