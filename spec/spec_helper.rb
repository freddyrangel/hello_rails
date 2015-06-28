require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require "tmpdir"
require "godot"
require 'fileutils'
require 'webmock/rspec'
require 'hello_rails'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.before(:each) do
    stub_request(:any, /api.github.com/).to_rack(FakeGithub)
  end
end
