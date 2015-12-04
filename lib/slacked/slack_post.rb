module Slacked
  class << self

    def post
      send = Slack::Notifier.new ENV["SLACK_WEBHOOK"]
      send.ping ENV["SLACK_MESSAGE"], icon_emoji: ":ghost:"
     end
  end
end
