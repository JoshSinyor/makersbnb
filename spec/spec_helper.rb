# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'features/web_helpers'

require_relative "../app"

Capybara.app = MakersBNBapp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end

  config.after(:suite) do
    ActiveRecord::Base.subclasses.each(&:delete_all)

    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end
    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
    config.shared_context_metadata_behavior = :apply_to_host_groups
  end
end
