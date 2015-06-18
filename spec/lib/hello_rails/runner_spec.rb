require 'spec_helper'

RSpec.describe HelloRails::Runner do
  let(:args) { ['-p', 'This is sparta!'] }
  let(:runner) { HelloRails::Runner.new(cli_arguments: args) }

  describe "#initialize" do
    it 'should not blow up' do
      expect { runner }.to_not raise_error
    end
  end

  describe '#run' do
    it 'should not blow up' do
      expect { runner.run }.to_not raise_error
    end
  end
end
