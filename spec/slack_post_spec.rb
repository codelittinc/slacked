require 'spec_helper'

describe Slacked do

  let(:message) { 'Gothan is calling!' }
  before(:each) {
    ENV[Slacked::SLACK_WEBHOOK_URL_KEY] = 'slack.mywebhook.com'
  }

  context 'post' do
    it 'returns false when message is blank' do
      expect(Slacked.post('')).to be_falsey
    end

    it 'returns false when message is nil' do
      expect(Slacked.post(nil)).to be_falsey
    end

    it 'uses the env variable SLACK_DEFAULT_MESSAGE if no message is passed' do
      expect_any_instance_of(Slack::Notifier).to receive(:ping).with(message, Slacked::SLACK_DEFAULT_CONFIG).and_return(true)
      ENV[Slacked::SLACK_DEFAULT_MESSAGE_KEY] = message
      expect(Slacked.post).to be_truthy
    end

    it 'merges with the default config when config is passed' do
      config = {
        icon_emoji: ':ghost:',
        webhook_url: 'WEBHOOK_URL'
      }
      expect_any_instance_of(Slack::Notifier).to receive(:ping).with(message, config).and_return(true)
      expect(Slacked.post(message, config)).to be_truthy
    end
  end

  context 'calls ping method of Slack Notifier' do
    before(:each) {
      expect_any_instance_of(Slack::Notifier).to receive(:ping).with(message, Slacked::SLACK_DEFAULT_CONFIG).and_return(true)
    }

    context 'async' do
      it 'post method is called async' do
        thread = Slacked.post_async(message)
        expect(thread.value).to be_truthy
        expect(thread.class).to eql(Thread)
      end
    end

    context 'sync' do
      it 'the ping method of Slack::Notifier is called' do
        expect(Slacked.post(message)).to be_truthy
      end
    end
  end
end
