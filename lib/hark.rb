require "rubygems"
require "bundler/setup"
require "httparty"
require "active_support"
require "active_support/core_ext/object/blank"

module Hark

  autoload :VERSION, 'hark/version'
  autoload :API, 'hark/api'
  autoload :Configuration, 'hark/configuration'

  class << self

    # An environment object used for configuration.
    def env
      @_env ||= ActiveSupport::StringInquirer.new(ENV["HARK_ENV"] || "production")
    end
  end

end
