module Slacked
  SLACK_PROFILE_IMAGE=':robot_face:'
  SLACK_WEBHOOK_URL_KEY='SLACK_WEBHOOK'
  SLACK_DEFAULT_MESSAGE_KEY='SLACK_DEFAULT_MESSAGE'
  SLACK_CONFIG= {
      icon_emoji: SLACK_PROFILE_IMAGE
  }

  class << self
    def post message = ENV[SLACK_DEFAULT_MESSAGE_KEY]
      return false if message.nil? || message.empty?
      notifier = slack_notifier
      notifier.ping message, SLACK_CONFIG
    end

    def post_async message
      Thread.start { post(message) }
    end

    private
    def slack_notifier webhook_url = ENV[SLACK_WEBHOOK_URL_KEY]
      Slack::Notifier.new webhook_url
    end
  end
end
