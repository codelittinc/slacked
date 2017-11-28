module Slacked
  SLACK_PROFILE_IMAGE=':robot_face:'
  SLACK_WEBHOOK_URL_KEY='SLACK_WEBHOOK'
  SLACK_DEFAULT_MESSAGE_KEY='SLACK_DEFAULT_MESSAGE'
  SLACK_DEFAULT_CONFIG= {
      icon_emoji: SLACK_PROFILE_IMAGE
  }

  class << self
    def post message = ENV[SLACK_DEFAULT_MESSAGE_KEY], webhook_url = ENV[SLACK_WEBHOOK_URL_KEY], config = SLACK_DEFAULT_CONFIG
      return false if message.nil? || message.empty? || disabled?
      slack_notifier(webhook_url).ping message, SLACK_DEFAULT_CONFIG.merge(config)
    end

    def post_async message= ENV[SLACK_DEFAULT_MESSAGE_KEY], webhook_url = ENV[SLACK_WEBHOOK_URL_KEY], config = SLACK_DEFAULT_CONFIG
      Thread.start do
        result = post(message, config, webhook_url)
        defined?(ActiveRecord) ? ActiveRecord::Base.connection.close : nil
        result
      end
    end

    def disabled?
      return false unless rails?
      rails_config = Rails.application.config
      rails_config.respond_to?(:slacked_disabled) && rails_config.slacked_disabled
    end

    private
    def slack_notifier webhook_url
      Slack::Notifier.new webhook_url
    end

    def rails?
      defined?(Rails)
    end
  end
end
