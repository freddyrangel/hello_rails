require 'spec_helper'

RSpec.describe HelloRails::Runner do
  describe '#run' do
    it 'sends create message to app if to cli_handler successful' do
      cli_handler = double('HelloRails::CliHander', get_args: true, app_args: {})
      app         = double('HelloRails::App', create!: true)
      runner      = HelloRails::Runner.new(cli_handler: cli_handler, app: app)

      runner.run
      expect(app).to have_received(:create!).once
    end

    it 'does not send create message to app if cli_handler fails' do
      cli_handler = double('HelloRails::CliHander', get_args: false, app_args: {})
      app         = double('HelloRails::App', create!: true)
      runner      = HelloRails::Runner.new(cli_handler: cli_handler, app: app)

      runner.run
      expect(app).to_not have_received(:create!)
    end
  end
end
