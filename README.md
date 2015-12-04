# Slacked

A simple and easy way to send notifications to Slack from your application.

## Getting Started

A simple and easy way to send notifications to Slack from your Rails application. A use case for this would be to post a notification in Slack when a new User is created or a certain action has been taken in your application.

```ruby
gem 'slacked'
```

And then execute:

    $ bundle

Then run the installer:

    $ bundle exec rails g slacked:install

This will create a .env file in the root of the rails appication. Specify the Webhook Url and the message to be sent.

```ruby
SLACK_WEBHOOK= "WEBHOOK_URL"
SLACK_MESSAGE= "TEST"
```


## Usage

To send the message to slack use the method:

```ruby
Slacked.post
```

## Example

```ruby
class Post < ActiveRecord::Base
  after_create :slacked

  private
  
  def slacked
    Slacked.post
  end
end
```

## Contributors

- [Sean H.](https://github.com/seathony)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

