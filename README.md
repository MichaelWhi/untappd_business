# Untappd Business

A simple gem to download menu items from from the untappd business API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'untappd_business'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install untappd_business

## Requirements/API Token

You need a business API read token for this to work. Get one at https://business.untappd.com/api_tokens.

You can then set your authentication info globally using the ENV variables 
`UNTAPPD_BUSINESS_AUTH_EMAIL` and `UNTAPPD_BUSINESS_AUTH_TOKEN`, or can enter them later during usage.

Later, you will query a specific menu section ID. You can see this ID in your browser URL bar 
when you edit a specific menu section on the Untappd website. 

## Usage

```ruby
# supply auth info in constructor:
beer_client = Client.new(auth_email: "user@example.com", auth_token: "abc123abc123") 
# or set ENV variables (see above), and then simply create a new instance:
beer_client = Client.new

# then 
all_the_beers = beer_client.menu_items(12345)  # 12345 is the menu section ID
puts all_the_beers.first.ibu # => "18.0"

# or search for a specific beer (results are cached, so this will not make a request)
puts beer_client.beer(items.first.untappd_id)
puts beer_client.beer(123) # 123 is the untappd beer id ("BID")

# if you have not called `menu_items` before, no items are present, so you have to supply a menu section id:
puts beer_client.beer(123, 12345) # 123 is the untappd beer id, 12345 the menu section ID
```

*Note:* a small CLI tool is also available, run `bundle exec untappd help` for more info.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MichaelWhi/untappd.

