require 'test_helper'

describe Ruboty::Url::Actions::Title do
  subject { Ruboty::Url::Actions::Title.new(mock_message) }

  let(:mock_message) { mock }

  before do
  end

  describe '#call' do
    let(:url) { 'https://foo/' }
    let(:title) { "foo's title" }
    let(:timestamp) { Time.at(100) }

    it 'should get HTML title' do
      # stub
      mock_message.stubs(:[]).with(0).returns(url)
      OpenURI.stubs(:open_uri).yields(StringIO.new("<html><head><title>#{title}</title></head></html>"))
      Time.stubs(:now).returns(timestamp)
      # mock
      attachments = [{
        color: '#0099ff',
        title: title,
        title_link: url,
        ts: timestamp.to_i,
      }]
      mock_message.expects(:reply).with(nil, attachments: attachments).once
      subject.call
    end
  end
end
