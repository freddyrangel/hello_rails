require 'spec_helper'

describe 'Generates Rails Application', type: :integration do
  let(:temporary_path)    { Dir.mktmpdir("rails_integration") }
  let(:destination_path)  { File.expand_path("cylon_raiders", temporary_path) }
  let(:app_args)          { { app_name: 'Galactica' } }
  let(:cli_handler)       { instance_double 'HelloRails::CliHandler',
                            get_args: app_args }
  let(:hello_rails)       { HelloRails::Runner.new cli_handler: cli_handler }

  before(:each) do
    hello_rails.run
  end

  after(:each) { FileUtils.rm_rf(app_args[:app_name]) }

  def step(message, &block)
    RSpec.configuration.reporter.message("  #{message}")
    yield
  end

  it 'creates the application with the right name' do
    expect(Dir.exist?(HelloRails.gem_root + app_args[:app_name])).to eq(true)
  end
end
