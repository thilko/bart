require "spec_helper"

describe Bart::App do
  include Rack::Test::Methods

  def app
    Bart::App
  end

  describe "GET /" do

    it "should render the home page" do
      get "/"
      last_response.should be_ok
      last_response.body.should include("Testserver Monitoring")
    end
  end

  describe "GET /server/goya/up" do
    it "should save the status for test server" do
      get "/server/goya/up"
      
      last_response.should be_ok
      Bart::Server.first(:name => "goya").up?.should be_true
    end
  end 
  
  describe "GET /server/goya/down" do
    it "should save the status for test server" do
      get "/server/goya/down"
      
      last_response.should be_ok
      Bart::Server.first(:name => "goya").down?.should be_true
    end
  end 
  
  describe "GET /server/goya/deploy" do
    it "should save the status for test server" do
      get "/server/goya/deploy"

      last_response.should be_ok
      Bart::Server.first(:name => "goya").deploy?.should be_true
    end
  end

  describe "GET /server/goya/log/any_log_message" do
    it "should save the status for test server" do
      get "/server/goya/log/any_log_message"

      last_response.should be_ok
      Bart::Server.first(:name => "goya").message.should == "any_log_message"
    end
  end 

  describe "POST /server/goya/deploy" do
    before do
      Bart::Server.any_instance.expects(:deploy)
    end

    it "should start the deployment for the server" do
      put "/server/goya/deploy"

      last_response.should be_ok
    end
  end 
end

