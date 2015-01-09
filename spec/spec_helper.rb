#test coverage
require 'simplecov'
if ENV['CIRCLE_ARTIFACTS'].nil?
  SimpleCov.coverage_dir  'coverage'
else
  module SimpleCov::Configuration
    def coverage_path
      FileUtils.mkdir_p coverage_dir
      coverage_dir
    end
  end
  SimpleCov.coverage_dir  "#{ENV['CIRCLE_ARTIFACTS']}/simplecov"
end
SimpleCov.start 'rails' do 
  add_filter "app/workers/bible_crawler/"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

#capybara
require 'capybara/rspec'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, :type => :controller

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    FactoryGirl.create_list(:bible_verse, 3) 
  end

  config.after(:each) do
    Timecop.return
    DatabaseCleaner.clean
  end 
end
