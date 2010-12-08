require "spec_helper"

describe Server do
  let(:server) { Server.new }

  describe "#deploy" do
    it "should make a deploy ssh call"

    it "should set the state to :deploy" do
      server.deploy
      server.status.should == "deploy"
    end
  end

  describe "#finish" do
    it "should set the state to finish"
  end

  describe "#error" do
    it "should set the state to error"
  end
end
