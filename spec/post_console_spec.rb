require 'spec_helper'

describe '.env' do
  it 'should exist in root' do
    expect(File).to be_file(".env")
  end

  it 'should contain SLACK_WEBHOOK' do
    expect(File.read(".env")).to include "SLACK_WEBHOOK"
  end

  it 'should contain SLACK_DEFAULT_MESSAGE' do
    expect(File.read(".env")).to include "SLACK_DEFAULT_MESSAGE"
   end
end
