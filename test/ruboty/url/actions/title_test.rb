require 'test_helper'

describe Ruboty::Url::Actions::Title do
  subject { Ruboty::Url::Actions::Title.new(mock_message) }

  let(:mock_message) { mock }

  before do
  end

  describe '#call' do
    it 'should get HTML title' do
      # stub
      mock_message.stubs(:[]).with(0).returns('https://foo/')
      OpenURI.stubs(:open_uri).yields(StringIO.new('<html><head><title>foo</title></head></html>'))
      # StringIO.any_instance.stubs(:read).returns('<html><head><title>foo</title></head></html>')
      # mock
      mock_message.expects(:reply).with('foo', to: nil).once
      subject.call
    end
  end
end
