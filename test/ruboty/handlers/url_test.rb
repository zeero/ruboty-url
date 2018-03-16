ENV['RUBOTY_URL_REGEXP'] = '(https://0.0.0.0:8888.*|http://1.1.1.1.*)'

require 'test_helper'

describe Ruboty::Handlers::Url do
  let(:robot) { Ruboty::Robot.new }

  before do
  end

  describe '#title' do
    let(:action) { Ruboty::Url::Actions::Title }
    let(:mock_action_call) { mock.tap { |mock| mock.expects(:call).once } }

    it '環境変数RUBOTY_URL_REGEXPとマッチする文字列に反応する' do
      url = 'http://1.1.1.1/foo'
      action
        .stubs(:new)
        .with do |message|
          p "message: #{message}"
          message[0].must_equal url
        end
        .returns(mock_action_call)

      robot.receive(body: url, from: 'sender', to: 'channel')
    end

    it '環境変数RUBOTY_URL_REGEXPとマッチしない文字列に反応しない' do
      url = 'https://0.0.0.0'
      action.any_instance.expects(:call).never
      robot.receive(body: url, from: 'sender', to: 'channel')
    end
  end
end
