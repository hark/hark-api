module Hark
  class API

    include ::HTTParty

    if Hark.env.production?
      base_uri 'https://api.hark.com/1.0'
    else
      base_uri 'http://api.hark.dev/1.0'
    end

    # Queries the API for the clip JSON
    # @param [String] clip_id The clip identifier
    # @return [String] Returns a JSON representation of the clip.
    def clip( clip_id )
      self.class.get("/clips/#{clip_id}.json", options)
    end

    # Queries the API for the search term
    # @param [String] search_term The clip identifier
    # @return [String] Returns a JSON array of clips
    def search(search_term)
      search_options = options
      search_options[:query] = { 'keywords' => search_term }
      puts search_options
      self.class.get("/clips/search.json", search_options)
    end

    # Default options passed back to in a HTTParty call.
    # @return [Hash] Returns hash of options for a HTTParty call.
    def options
      { :headers => { 'X-HarkToken' => self.class.configuration.api_key } }
    end

    class << self

      # Configuration object.  Acts like a hash and return sensible values for
      # all configuration options.  See Hark::Configuration.
      attr_writer :configuration

      # Call this method to configure the library at runtime.
      #
      # @example
      #   Hark::API.configure do |config|
      #     config.api_key = '1234567890abcdef'
      #   end
      def configure
        yield(configuration)
        @api ||= API.new
      end

      # The configuration object.
      # @see Hark::API.configure
      def configuration
        @configuration ||= Configuration.new
      end

      # The api object.
      # @see Hark::API
      def api
        raise ArgumentError if configuration.api_key.blank?
        @api
      end

      # Queries the API for the clip JSON.
      # @see Hark::API#clip
      def clip(clip_id)
        api.clip(clip_id)
      end

      # Queries the API for the search term
      # @see Hark::API#search
      def search(search_term)
        api.search(search_term)
      end
    end
  end
end
