require 'ruboty/url'

module Ruboty
  module Url
    module Actions
      # Ruboty::Url::Actions::Title
      class Title < Ruboty::Actions::Base
        def call
          url = message[0]
          attachment = {
            color: '#E2E2E2',
            title_link: url,
          }
          open(url) do |f|
            html = Nokogiri::HTML(f)
            attachment[:title] = html.xpath('/html/head/title').text

            # optional infos
            og_title = html.xpath('/html/head/meta[@property="og:title"]/@content').first
            attachment[:title] = og_title.text if og_title.present?
            og_site_name = html.xpath('/html/head/meta[@property="og:site_name"]/@content').first
            attachment[:author_name] = og_site_name.text if og_site_name.present?
            favicon_url = html.xpath('/html/head/link[@rel="icon"]/@href').first
            attachment[:author_icon] = favicon_url.text if favicon_url.present?
            og_description = html.xpath('/html/head/meta[@property="og:description"]/@content').first
            attachment[:text] = og_description.text if og_description.present?
            og_image = html.xpath('/html/head/meta[@property="og:image"]/@content').first
            attachment[:thumb_url] = og_image.text if og_image.present?
          end
          message.reply(nil, attachments: [attachment]) if attachment[:title].present?
        end
      end
    end
  end
end
