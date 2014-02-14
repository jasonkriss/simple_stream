require 'http/request'
require 'addressable/uri'
require 'simple_oauth'
require 'simple_stream/connection'
require 'simple_stream/response'

module SimpleStream
  class Client
    attr_reader :connection

    USER_AGENT = "SimpleStream Ruby Gem #{SimpleStream::VERSION}"

    def initialize
      @connection = SimpleStream::Connection.new
    end

    def site(user_ids, opts = {}, &block)
      request(:get, 'https://sitestream.twitter.com:443/1.1/site.json', opts.merge(follow: user_ids.join(',')), &block)
    end

    def user(opts = {}, &block)
      request(:get, 'https://userstream.twitter.com:443/1.1/user.json', opts, &block)
    end

    def filter(opts = {}, &block)
      request(:post, 'https://stream.twitter.com:443/1.1/statuses/filter.json', opts, &block)
    end

    def sample(opts = {}, &block)
      request(:get, 'https://stream.twitter.com:443/1.1/statuses/sample.json', opts, &block)
    end

    def firehose(opts = {}, &block)
      request(:get, 'https://stream.twitter.com:443/1.1/statuses/firehose.json', opts, &block)
    end

    private
    def request(method, uri, params)
      headers = default_headers.merge(:authorization => oauth_auth_header(method, uri, params).to_s)
      request = HTTP::Request.new(method, uri + '?' + to_url_params(params), headers)
      response = SimpleStream::Response.new { |data| yield(data) }
      connection.stream(request, response)
    end

    def oauth_auth_header(method, uri, params = {})
      uri = Addressable::URI.parse(uri)
      config = SimpleStream.config
      SimpleOAuth::Header.new(method, uri, params, {
        consumer_key: config.consumer_key,
        consumer_secret: config.consumer_secret,
        token: config.access_token,
        token_secret: config.access_secret
      })
    end

    def to_url_params(params)
      params.collect { |k, v| [k, URI.encode(v)].join('=') }.sort.join('&')
    end

    def default_headers
      { accept: '*/*', user_agent: USER_AGENT }
    end
  end
end
