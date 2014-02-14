require 'simple_stream/client'
require 'simple_stream/version'

module SimpleStream
  def self.configure
    yield config
  end

  def self.config
    @config ||= Configuration.new
  end

  class Configuration
    attr_accessor :consumer_key, :consumer_secret,
                  :access_token, :access_secret
  end
end
