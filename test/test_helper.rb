%W{
  pp
  test/unit
  mocha
  shoulda-context
  vcr
  json/pure
  active_support/hash_with_indifferent_access
}.each do |g|
  begin
    require g
  rescue LoadError
    require 'rubygems'
    require g
  end
end

require 'json/pure'

VCR.config do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.stub_with :webmock
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
