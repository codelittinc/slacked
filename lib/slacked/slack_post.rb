module Slacked
  class << self

    def post message = ENV["SLACK_MESSAGE"]
      send = Slack::Notifier.new ENV["SLACK_WEBHOOK"]
      send.ping message, icon_emoji: ":ghost:"
     end
  end
end
