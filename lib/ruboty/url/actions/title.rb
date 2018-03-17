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
            html = f.read
            title = html.scan(/<title>(.*?)<\/title>/).flatten.first
          end
          attachments = [{
            color: '#0099ff',
            title: title,
            title_link: url,
            ts: Time.now,
          }]
          message.reply(title, { attachments: attachments }) unless title.empty?
        end
      end
    end
  end
end
