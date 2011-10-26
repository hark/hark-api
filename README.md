Hark API
========

A Ruby Gem to access the hark.com API

About Hark
----------
hark.com is a site that publishes movie quote sound bites and still images.
This gem is used to access these sounds :mega:, still images, and other
information in a programatic fashion.

Example
-------

```shell
  api = Hark::API.new(:token => 'a-token')
  api.clip('jxxcfhxywx') # returns JSON
```
