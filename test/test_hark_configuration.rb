require 'test_helper'

class TestHarkConfiguration < Test::Unit::TestCase

  context "the instance" do

    setup do
      @configuration = Hark::Configuration.new
      @configuration.api_key = "abc123"
    end

    should "have api key set" do
      assert_equal "abc123", @configuration.api_key
    end

  end

  context "the configuration" do


    should "configure the api key in the configure block" do

      Hark::API.configure do |config|
        config.api_key = '1234567890abcdef'
      end

      assert_equal '1234567890abcdef', Hark::API.configuration.api_key
    end

  end

end
