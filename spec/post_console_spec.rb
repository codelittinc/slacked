require 'spec_helper'

describe ".env" do
  it 'should exist in install' do
    expect(File).to be_file("lib/generators/slacked/install/templates/.env")
  end

  it 'should contain SLACK_WEBHOOK' do
    expect(File.read("lib/generators/slacked/install/templates/.env")).to include "SLACK_WEBHOOK"
  end

  it 'should contain SLACK_MESSAGE' do
    expect(File.read("lib/generators/slacked/install/templates/.env")).to include "SLACK_MESSAGE"
   end
end
