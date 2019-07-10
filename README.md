[![Gem Version](https://badge.fury.io/rb/slacked.svg)](https://badge.fury.io/rb/slacked) [![Circle CI](https://circleci.com/gh/codelittinc/slacked.svg?style=svg)](https://circleci.com/gh/codelittinc/slacked)

# Slacked

This is a super simple Slack integration for Ruby and for Ruby and Rails applications. A use case for this would be to post a notification in Slack when a new User is created or a certain action has been taken in your application.

Are there other gems that provide similar functionality? Yes. Do some of them provide more flexibility? Yes. The point of this was to make installing and integrating a 30 second process.

This gem can be used with a rails application and enabled/disabled based on the environment config as you may see below

## Getting Started

#### without rails

```ruby
gem install slacked
```


#### With rails
 Add this line to your application's Gemfile:

```ruby
gem 'slacked'
```

And then execute:

    $ bundle

Then run the installer:

    $ bundle exec rails g slacked:install

This will create a .env file in the root of the rails application. Specify the default Webhook Url and the message to be sent.

```ruby
SLACK_WEBHOOK= "WEBHOOK_URL"
SLACK_DEFAULT_MESSAGE= "TEST"
```


## Usage
Set the SLACK_WEBHOOK env variable with the default value of the webhook which you want to send the messages. If you would like to send messages to different webhooks, you can do so by specifying the webhook url in the `config` parameter to `Slacked#post` or `Slacked#post_async`.
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

### To pass the config:

```ruby
Slacked.post "I have a message from the underworld!", {icon_emoji: ':ghost:'}
```

or
```ruby
Slacked.post_async "Let's play fetch!", {icon_emoji: ':dog:'}
```

or
```ruby
Slacked.post_async 'This goes to a specific channel!', {webhook_url: <WEBHOOK_URL>}
```

Right now we only have the config for the icon and the webhook url, if you need another one let us know or submit a pull request.

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

- [Kaio Magalhães](https://github.com/kaiomagalhaes)
- [Lockyy](https://github.com/Lockyy)
- [Sean H.](https://github.com/seathony)
- [Tomas Barry](https://github.com/TomasBarry)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
