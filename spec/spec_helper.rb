require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require './app.rb'
require './spec/db_helper.rb'

ENV['RACK_ENV'] = 'test'

SimpleCov.start

Capybara.app = App

RSpec.configure do |config|
  config.before(:each) do
    clear_down_tables()
    populate_bookmarks()
    populate_comments()
    populate_tags()
    populate_bookmark_tags()
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
