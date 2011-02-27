require "spec_helper"

describe Bart do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "should render the home page" do
      get '/'
      last_response.should be_ok
      last_response.body.should include("Testserver Monitoring")
    end
  end

  describe "GET /server/testname/up" do
    it "should have specs"
  end 
end

