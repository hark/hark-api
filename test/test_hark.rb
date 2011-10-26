require 'test_helper'

class TestHark < Test::Unit::TestCase

  def test_default_env
    assert_true Hark.env.production?
    assert_false Hark.env.test?
  end

end
