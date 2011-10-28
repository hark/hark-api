%W{ pp test/unit mocha shoulda-context }.each do |g|
  begin
    require g
  rescue LoadError
    require 'rubygems'
    require g
  end
end

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'hark'))

class Test::Unit::TestCase

  def assert_true(what)
    assert_equal true, what
  end

  def assert_false(what)
    assert_equal false, what
  end

end
