require 'spec_helper'

RSpec.describe HelloRails::Messenger do
  let(:app_data) { double(name: 'mycoolname', title_name: 'titlename', repo: 'random') }
  let(:messenger) { HelloRails::Messenger.new(app_data: app_data) }

  describe '#welcome' do
    it 'should not blow up' do
      expect { messenger.welcome }.to output.to_stdout
    end
  end

  describe '#directory_not_empty' do
    it 'should not blow up' do
      expect { messenger.directory_not_empty }.to output.to_stdout
    end
  end

  describe '#repo_has_no_tags' do
    it 'should not blow up' do
      expect { messenger.repo_has_no_tags }.to output.to_stdout
    end
  end

  describe '#failed_github_request' do
    it 'should not blow up' do
      expect { messenger.failed_github_request }.to output.to_stdout
    end
  end

  describe '#sucess_message' do
    it 'should not blow up' do
      expect { messenger.success_message }.to output.to_stdout
    end
  end
end
