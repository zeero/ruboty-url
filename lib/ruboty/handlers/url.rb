require "ruboty/url/actions/title"

module Ruboty
  module Handlers
    class Url < Base
      on /url title/, name: 'title', description: 'TODO: write your description'

      def title(message)
        Ruboty::Url::Actions::Title.new(message).call
      end
    end
  end
end
