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

The Hark API is accessed through a HTTP GET focused REST interface currently
supporting JSON and JSONP formats.  The API is currently version 1.0 and is only
accessible over HTTPS.  The token to access the API is submitted as a HTTP
header with the name X-HarkToken.

#### JSON Access

```shell
curl --verbose -H "X-HarkToken: a-token" "https://api.hark.com/1.0/clips/jxxcfhxywx.json"
```

#### JSONP Access

The value of callback is the variable name that is returned wrapping the result
JSON.

```shell
curl --verbose -H "X-HarkToken: a-token" "https://api.hark.com/1.0/clips/jxxcfhxywx.json?callback=wrapper"
```

Formatting
----------

### API Information

All results return information about the request and its results.

* version - API Version.
* when - When these results returned.
* what - The kind of object requested, clip, clips, collection, collections, etc.
* message - A message about the request.
* status - The HTTP status given with the result.


### Error results

#### Missing query parameters

HTTP Status 400.  Parameter(s) for the query were missing.

```json
{
  "collections": [

  ],
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 05:39:41 UTC 2011",
    "what": "collections",
    "message": "missing keywords query",
    "status": 400
  }
}
```

#### Authorization Failure

HTTP Status 401.  The API token given was not authorized.

```json
{
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 05:34:41 UTC 2011",
    "what": "clips",
    "message": "Unauthorized",
    "status": 401
  },
  "clip": {
  }
}
```

#### Not Found

HTTP Status 404.  The resource requested was not found.

```json
{
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 05:48:05 UTC 2011",
    "what": "clip",
    "message": "Not Found",
    "status": 404
  },
  "clip": {
  }
}
```

#### Unprocessable Entity

HTTP Status 422.  The URI of the query did not map to any resources currently
presented by the API.

```json
{
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 05:48:54 UTC 2011",
    "what": "noob",
    "message": "Unprocessable Entity",
    "status": 422
  }
}
```


### Clip JSON

#### Request

```shell
curl -H "X-HarkToken: a-token" "https://api.hark.com/1.0/clips/jxxcfhxywx.json"
```

#### Attributes

* audio_url - A CDN URL to the audio portion of the clip.  URL will have expiry information attached to it, and will expire in 60 minutes from the time of the request.
* canonical_url - Unique URL of the clip.
* description - A description of the clip.
* duration - The clip's duration in seconds.
* image_urls - An array of images associated with the clip.
* name - The name of the clip.
* pid - Unique identifier of the clip.
* quote - A distinctive quote from the clip.
* short_url - A bit.ly shortened URL to the clip.

#### Example

```json
{
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 05:58:46 UTC 2011",
    "what": "clip",
    "message": "OK",
    "status": 200
  },
  "clip": {
    "audio_url": "*** A VALID EXPIRING CDN AUDIO URL ***",
    "canonical_url": "http://hark.com/clips/jxxcfhxywx-i-have-a-dream-today",
    "description": "Martin Luther King Jr. gives his I Have a Dream Speech.",
    "duration": 2,
    "image_urls": [
      "http://cdn2.hark.com/images/000/000/224/224/martin-luther-king-jr_large.jpg"
    ],
    "name": "I have a dream today",
    "pid": "jxxcfhxywx",
    "quote": "\"I have a dream today!\"",
    "short_url": "http://bit.ly/fPKQmO"
  }
}
```

### Clips Search JSON

#### Request

```shell
curl -H "X-HarkToken: a-token" "https://api.hark.com/1.0/clips/search?keywords=a+search+phrase"
```

#### Attributes

* clips - An array of clips specified above.

#### Example

```json
{
  "clips": [
    { SEE CLIP DESCRIPTION ABOVE },
    { SEE CLIP DESCRIPTION ABOVE },
    { SEE CLIP DESCRIPTION ABOVE }
  ],
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 06:10:11 UTC 2011",
    "what": "clips",
    "message": "OK",
    "status": 200
  }
}
```

### Collection JSON

#### Request

```shell
curl -H "X-HarkToken: a-token" "https://api.hark.com/1.0/collections/nfngpynlrd.json"
```

#### Attributes

* canonical_url - Unique URL of the collection.
* clip_pids - Array of clip pids belonging to the collection.
* description - A description of the collection.
* image_urls - Array of images belonging to the collection.
* name - The name of the collection.
* pid - Unique identifier of the collection.
* short_url - A bit.ly shortened URL to the collection.

#### Example

```json
{
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 06:21:28 UTC 2011",
    "what": "collection",
    "message": "OK",
    "status": 200
  },
  "collection": {
    "canonical_url": "http://hark.com/collections/nfngpynlrd-the-godfather",
    "clip_pids": [
      "jtpmzgfktg",
      "mdgnglbypn",
      "vlbldnhdlc",
      "kmbksnnsry"
    ],
    "description": "The Godfather is a 1972 American crime drama film based on the 1969 novel ...",
    "image_urls": [
      "http://cdn0.hark.com/images/000/001/572/1572/the-godfather_large.jpg",
      "http://cdn2.hark.com/images/000/046/310/46310/the-godfather_large.jpg",
      "http://cdn2.hark.com/images/000/425/462/425462/the-godfather_large.jpg"
    ],
    "name": "The Godfather",
    "pid": "nfngpynlrd",
    "short_url": "http://hark.com/collections/nfngpynlrd-the-godfather"
  }
}
```

### Collections Search JSON

#### Request

```shell
curl -H "X-HarkToken: a-token" "https://api.hark.com/1.0/collections/search?keywords=a+search+phrase"
```

#### Attributes

* collections - An array of collections specified above.

#### Example

```json
{
  "collections": [
    { SEE COLLECTION DESCRIPTION ABOVE },
    { SEE COLLECTION DESCRIPTION ABOVE },
    { SEE COLLECTION DESCRIPTION ABOVE }
  ],
  "api": {
    "version": "1.0.1",
    "when": "Tue Nov 01 06:10:11 UTC 2011",
    "what": "collections",
    "message": "OK",
    "status": 200
  }
}
```


Ruby Examples
-------------

Configure the API and fetch a clip.

```ruby
require 'hark'

Hark::API.configure do |config|
  config.api_key = 'the-key'
end

Hark::API.clip('jxxcfhxywx') # returns JSON
```
