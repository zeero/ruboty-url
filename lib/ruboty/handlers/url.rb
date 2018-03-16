require 'ruboty/url'

module Ruboty
  module Handlers
    # url
    class Url < Base
      on(Regexp.new(ENV['RUBOTY_URL_REGEXP'] || '$^'), name: 'title', description: 'Show html title with specified url.', all: true)

      def title(message)
        Ruboty::Url::Actions::Title.new(message).call
      end
    end
  end
end
