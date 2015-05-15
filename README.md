# OmniAuth::ChannelAdvisor

OmniAuth strategy for ChannelAdvisor OAuth2

## Usage

Use to retrieve an access token for use with the REST API:
http://developers.channeladvisor.com/rest/


You must first register your application in the ChannelAdvisor Developer Console
https://api.channeladvisor.com/developerconsole

When you register the application, you will get an 'application ID' and 'shared secret'.
These need to be provided when you configure the strategy
(this example assumes the values are available in environment variables):

```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :channel_advisor, ENV['APPLICATION_ID'], ENV['SHARED_SECRET']
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-channel_advisor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-channel_advisor


## Contributing

1. Fork it ( https://github.com/ShippingEasy/omniauth-channel_advisor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
