source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'haml-rails'

# Gems for tagging, commenting and voting.

gem 'acts_as_votable', '~> 0.10.0'
gem 'acts_as_commentable', '~> 3.0.1'
gem 'make_flaggable', :git => 'git://github.com/ScottyGams/make_flaggable.git'

# Gems to work with APIs

gem 'json'
gem 'httparty'

# Gems for data visualisation and front-end management.

gem 'date-input-rails', '~> 0.0.3'
gem 'ransack'
gem 'carrierwave', '~> 0.9.0'
gem "fog", "~> 1.3.1"
gem 'rmagick'
gem 'kaminari'

# Gems for geocoding & location

gem 'geocoder'


# Gems for authorisation and authentication

gem 'devise'
gem 'cancan', '~> 1.6.10'
gem 'omniauth' # still need to add facebook and twitter auth gems
gem 'omniauth-twitter'
gem 'omniauth-facebook'


# Gems for error handling

group :development, :test do
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'
end


# Gems for testing with rspec

group :development, :test do
  gem 'rspec-rails', '2.14.1'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'simplecov', '~> 0.7.1', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
