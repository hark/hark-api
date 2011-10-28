require 'test_helper'

class TestHarkAPI < Test::Unit::TestCase

  context "the configuration" do


    should "configure the api key in the configure block" do

      Hark::API.configure do |config|
        config.api_key = '1234567890abcdef'
      end

      assert_equal '1234567890abcdef', Hark::API.configuration.api_key
    end

  end

end
