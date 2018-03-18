require 'ruboty/url'

module Ruboty
  module Url
    module Actions
      # Ruboty::Url::Actions::Title
      class Title < Ruboty::Actions::Base
        def call
          url = message[0]
          title = ''
          open(url) do |f|
            doc = Nokogiri::HTML(f)
            title = doc.xpath('/html/head/title').text
          end
          attachments = [{
            color: '#EEEEEE',
            title: title,
            title_link: url,
          }]
          message.reply(nil, attachments: attachments) unless title.empty?
        end
      end
    end
  end
end
