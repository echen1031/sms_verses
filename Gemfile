source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'devise'
gem 'bootstrap-sass'
gem 'timezone'
gem 'simple_form'
gem 'validates_email_format_of', :git => 'git://github.com/alexdunae/validates_email_format_of.git'
gem 'phony_rails'
gem 'font-awesome-sass'
gem 'rails_admin'

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

gem 'nokogiri'
gem 'kaminari'
gem 'ruby-sendhub'
gem 'choices'
gem 'geocoder'
gem 'draper'

# if you require 'sinatra' you get the DSL extended to Object
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'slim'
gem 'sidekiq'
gem 'whenever', :require => false
gem "ransack"

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

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'pry-rails'
  gem 'pry-nav'
end

group :test do
  gem 'faker'
  gem 'forgery'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'timecop'  
end

gem 'rails_12factor', group: :production
gem 'unicorn'