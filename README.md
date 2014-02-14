# SimpleStream

A stripped-down Twitter streaming API client.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_stream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_stream

## Usage

Simply provide your credentials:

```ruby
SimpleStream.configure do |config|
  config.consumer_key = 'YOUR_CONSUMER_KEY'
  config.consumer_secret = 'YOUR_CONSUMER_SECRET'
  config.access_token = 'YOUR_ACCESS_TOKEN'
  config.access_secret = 'YOUR_ACCESS_SECRET'
end
```

and start streaming:

```ruby
client = SimpleStream::Client.new
client.user do |message|
  # Do something with the JSON
end
```

## Contributing

1. Fork it ( http://github.com/jasonkriss/simple_stream/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
