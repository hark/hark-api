require 'test_helper'

class TestHarkVersion < Test::Unit::TestCase

  def test_version
    assert_equal "0.0.1", Hark::VERSION
  end

end
