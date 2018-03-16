require 'open-uri'

require 'active_support'
require 'active_support/core_ext'

module Ruboty
  # Ruboty::Url
  module Url
    class << self
    end
  end
end

Dir[File.expand_path('url', __dir__) << '/**/*.rb'].each { |file| require file }
require 'ruboty/handlers/url'

