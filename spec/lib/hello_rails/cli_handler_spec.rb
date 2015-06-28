require 'spec_helper'

RSpec.describe HelloRails::CliHandler do
  let(:cli_handler) { HelloRails::CliHandler.new }

  describe '#get_args' do
    it 'should not raise error' do
      expect { cli_handler.get_args }.to_not raise_error
    end
  end
end
