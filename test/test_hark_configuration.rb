require 'test_helper'

class TestHarkConfiguration < Test::Unit::TestCase

  def setup
    @configuration = Hark::Configuration.new
    @configuration.api_key = "abc123"
  end

  def test_api_key
    assert_equal "abc123", @configuration.api_key
  end

end
