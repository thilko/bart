require "spec_helper"

describe ServersController do
  describe "routing" do
    it "should route to :index" do
      { :get => "/" }.should route_to(:controller => "servers", :action => "index" )
    end

  end
end
