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
          message.reply(title, to: nil) unless title.empty?
        end
      end
    end
  end
end
