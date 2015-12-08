# Slacked

This is a super simple Slack integration for Rails. A use case for this would be to post a notification in Slack when a new User is created or a certain action has been taken in your application.

Are there other gems that provide similar functionality? Yes. Do some of them provide more flexibility? Yes. The point of this was to make installing and integrating a 30 second process.

This gem can be used with a rails application and enabled/disabled based on the environment config as you may see below

## Getting Started

Add this line to your application's Gemfile:

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
SLACK_DEFAULT_MESSAGE= "TEST"
```


## Usage
Set the SLACK_WEBOOK env variable with the value of the webhook which you want to send the messages.
If you want to send a unique message in your application like 'Application is running' you can set the SLACK_DEFAULT_MESSAGE and call the message methods without sending an argument.


### To send a sync message to slack use the method:

```ruby
Slacked.post "This is a test post"
```

or

```ruby
Slacked.post
```
The last example will use the SLACK_DEFAULT_MESSAGE value

### To send an async message to slack use the method:

```ruby
Slacked.post_async "This is a test post"
```

or

```ruby
Slacked.post_async
```
The last example will use the SLACK_DEFAULT_MESSAGE value

## Example

```ruby
class Post < ActiveRecord::Base
  after_create :slacked

  private
  
  def slacked
    Slacked.post 'post created!'
  end
end
```

## Using with rails
If you are using this gem inside a rails application you can enable or disable it based on your environment, to do it you only need to add the code below in your config file.

```ruby
config.slacked_disabled = true
```

The default value is false

## Contributors

- [Sean H.](https://github.com/seathony)
- [Kaio Magalhães](https://github.com/kaiomagalhaes)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

