require 'test_helper'

class Ruboty::UrlTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ruboty::Url::VERSION
  end
end
