require 'test_helper'

class TestHarkAPI < Test::Unit::TestCase

  context "getting clips" do

    setup do
      Hark::API.configuration.api_key = nil
    end

    should "raise error when api key not set" do
      assert_raise(ArgumentError) { Hark::API.clip('jxxcfhxywx') }
    end

    should "fail getting a clip for a non-existent clip id" do
      Hark::API.configure do |config|
        config.api_key = 'an-api-key'
      end

      VCR.use_cassette('non-existent-clip') do
        json = Hark::API.clip('foo').body
        result = JSON.parse(json).symbolize_keys

        expected = { :status => 404, :message => 'Not Found', :pid => 'foo', :what => 'clip' }
        assert_equal expected, result
      end
    end

    should "get a clip" do

      Hark::API.configure do |config|
        config.api_key = 'an-api-key'
      end

      VCR.use_cassette('existing-clip') do
        json = Hark::API.clip('jxxcfhxywx').body
        result = JSON.parse(json).symbolize_keys
        # TODO implement when updates for API are deployed
        # assert_equal 200, result[:status]
        # assert_equal 'Success', result[:message]
        assert_equal 'jxxcfhxywx', result[:pid]
        assert_equal 'clip', result[:what]
      end
    end

  end

  context "searching for clips" do

    should "should raise error when api key not set"

    should "get a result with zero clips"

    should "get a result with many clips"

  end

  context "getting collections" do

    should "fail getting a collection and having a bad api key"

    should "fail getting a collection for a non-existent collection id"

    should "get a collection"

  end

  context "searching for collections" do

    should "should raise error when api key not set"

    should "get a result with zero collections"

    should "get a result with many collections"

  end

end
