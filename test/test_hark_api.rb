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

  context "getting clips" do

    should "fail getting a clip and having a bad api key"

    should "fail getting a clip for a non-existent clip id"

    should "get a clip"

  end

  context "searching for clips" do

    should "fail getting searching for clips and having a bad api key"

    should "get a result with zero clips"

    should "get a result with many clips"

  end

  context "getting collections" do

    should "fail getting a collection and having a bad api key"

    should "fail getting a collection for a non-existent collection id"

    should "get a collection"

  end

  context "searching for collections" do

    should "fail getting searching for collections and having a bad api key"

    should "get a result with zero collections"

    should "get a result with many collections"

  end

end
