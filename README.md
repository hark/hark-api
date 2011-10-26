Hark API
========

A Ruby Gem to access the hark.com API

About Hark
----------
hark.com is a site that publishes movie quote sound bites and still images.
This gem is used to access these sounds :mega: , still images, and other
information in a programmatic fashion.

Reference
---------

### Pure HTTP Example

The Hark API is accessed through a HTTP GET focused REST interface.  The API is
currently version 1.0 and is only accessible over HTTPS.  The token to access
the API is passed in as HTTP header with the X-HarkToken.

```shell
curl --verbose -H "X-HarkToken: the-key" https://api.hark.com/1.0/clips/jxxcfhxywx.json
```

### Ruby Example

```ruby
require 'hark'

Hark::API.configure do |config|
  config.api_key = 'the-key'
end

Hark::API.clip('jxxcfhxywx') # returns JSON
```

### Clip JSON

#### Attributes

  * pid - Unique identifier of the clip.
  * name - The name of the clip.
  * duration - The clip's duration in seconds.
  * short_url - A bitly shortened URL to the clip.
  * canonical_url - Unique URL of the clip.
  * version - The API version.
  * audio_url - A CDN URL to the audio portion of the clip.  URL will have expirery information attached to it, and will expire in 60 mintues from the time of the request.
  * what - The object the JSON represents, in this case a clip.
  * quote - A destinctive quote from the clip.
  * description - A description of the clip.
  * image_urls - An array of images associated with the clip.

#### Example

```json
{
  "pid": "xcfhxywx",
  "name": "I have a dream today",
  "duration": 2,
  "short_url": "http://bit.ly/fPKQmO",
  "canonical_url": "http://www.hark.com/clips/jxxcfhxywx-i-have-a-dream-today",
  "version": "1.0.1",
  "audio_url": "*** A VALID EXPIRING CDN AUDIO URL ***",
  "what": "clip",
  "quote": "\"I have a dream today!\"",
  "description": "Martin Luther King Jr. gives his I Have a Dream Speech.",
  "image_urls": [
    "*** A VALID CDN IMAGE URL ***"
  ]
}
```
