module Slacked
  SLACK_PROFILE_IMAGE=':robot_face:'
  SLACK_WEBHOOK_URL_KEY='SLACK_WEBHOOK'
  SLACK_DEFAULT_MESSAGE_KEY='SLACK_DEFAULT_MESSAGE'
  SLACK_CONFIG= {
      icon_emoji: SLACK_PROFILE_IMAGE
  }

  class << self
    def post message = ENV[SLACK_DEFAULT_MESSAGE_KEY]
      return false if message.nil? || message.empty? || disabled?
      notifier = slack_notifier
      notifier.ping message, SLACK_CONFIG
    end

    def post_async message
      Thread.start do
        result = post(message)
        defined?(ActiveRecord) ? ActiveRecord::Base.connection.close : nil
        result
      end
    end

    def disabled?
      return false if rails?
      rails_config = Rails.application.config
      rails_config.config.respond_to?(:slacked_disabled) && rails_config.slacked_disabled
    end

    private
    def slack_notifier webhook_url = ENV[SLACK_WEBHOOK_URL_KEY]
      Slack::Notifier.new webhook_url
    end

    def rails?
      defined?(Rails)
    end
  end
end
