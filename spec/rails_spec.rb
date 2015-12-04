require "spec_helper"

describe Slacked do
  before do
    run_simple <<-CMD
      rails new example \
        --skip-gemfile \
        --skip-bundle \
        --skip-keeps \
        --skip-sprockets \
        --skip-javascript \
        --skip-test-unit \
        --no-rc \
        --quiet
      CMD
    cd("example")
  end

  describe "rails generate slacked:install" do
   it "generates .env" do
     run_simple("rails generate slacked:install")
     check_file_presence([".env"], true)
   end
  end

  describe ".env" do
    it 'should contain SLACK_WEBHOOK' do
      expect(File.read(".env")).to include "SLACK_WEBHOOK"
    end

    it 'should contain SLACK_MESSAGE' do
      expect(File.read(".env")).to include "SLACK_MESSAGE"
    end
  end
end
