source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'figaro'
gem 'pry'
gem 'devise'
# For user role authorization
gem 'pundit'
# For processing user credit cards
gem 'stripe'
# For parsing and accepting Markdown text
gem 'redcarpet'
#error reporting
gem 'rollbar'
gem 'oj', '~> 2.12.14'
# For creating friendly/readable URL Slugs
gem 'friendly_id', '~> 5.1.0', :require => 'friendly_id'


group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'faker'
  gem 'factory_girl_rails'
end
