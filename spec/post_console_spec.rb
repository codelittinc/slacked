require 'spec_helper'

describe ".env" do
  let(:template_path) {
    "lib/generators/slacked/install/templates/.env"
  }

  it 'should exist in install' do
    expect(File).to be_file(template_path)
  end

  it 'should contain SLACK_WEBHOOK' do
    expect(file).to include "SLACK_WEBHOOK"
  end

  it 'should contain SLACK_MESSAGE' do
    expect(file).to include "SLACK_MESSAGE"
  end

  def file
    File.read(template_path)
  end
end
