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
end
