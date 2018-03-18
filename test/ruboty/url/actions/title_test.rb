require 'test_helper'

describe Ruboty::Url::Actions::Title do
  subject { Ruboty::Url::Actions::Title.new(mock_message) }

  let(:mock_message) { mock }

  before do
  end

  describe '#call' do
    let(:url) { 'https://foo/' }
    let(:title) { "foo's title" }

    it 'should get HTML title' do
      # stub
      mock_message.stubs(:[]).with(0).returns(url)
      OpenURI.stubs(:open_uri).yields(StringIO.new("<html><head><title>#{title}</title></head></html>"))
      # mock
      attachments = [{
        color: '#EEEEEE',
        title_link: url,
        title: title,
      }]
      mock_message.expects(:reply).with(nil, attachments: attachments).once
      subject.call
    end

    let(:og_title) { "bar's title" }
    let(:og_site_name) { "bar's site name" }
    let(:favicon_url) { "https://bar.site/favicon.ico" }
    let(:og_description) { "bar's description." }
    let(:og_image) { "https://bar.site/image.png" }

    it 'should get optional infos' do
      # stub
      mock_message.stubs(:[]).with(0).returns(url)
      OpenURI.stubs(:open_uri).yields(StringIO.new("<html><head><meta property=\"og:image\" content=\"#{og_image}\" /><meta property=\"og:site_name\" content=\"#{og_site_name}\" /><meta property=\"og:type\" content=\"object\" /><meta property=\"og:title\" content=\"#{og_title}\" /><meta property=\"og:url\" content=\"https://github.com/zeero/ruboty-url\" /><meta property=\"og:description\" content=\"#{og_description}\" /><title>#{title}</title><link rel=\"icon\" type=\"image/x-icon\" class=\"js-site-favicon\" href=\"#{favicon_url}\"></head></html>"))
      # mock
      attachments = [{
        color: '#EEEEEE',
        title_link: url,
        title: og_title,
        author_name: og_site_name,
        author_icon: favicon_url,
        text: og_description,
        thumb_url: og_image,
      }]
      mock_message.expects(:reply).with(nil, attachments: attachments).once
      subject.call
    end
  end
end
