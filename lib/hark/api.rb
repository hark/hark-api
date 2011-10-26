module Hark
  class API
    include ::HTTParty

    def initialize(config = {})
      @config = config
      @token = config[:token]
    end

    if Hark.env.production?
      base_uri 'https://api.hark.com/1.0'
    else
      base_uri 'http://api.hark.dev/1.0'
    end

    def clip( clip_id )
      self.class.get(
        "/clips/#{clip_id}.json",
        :headers => { 'X-HarkToken' => @token }
      )
    end
  end
end
