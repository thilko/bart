require "spec_helper"

describe Bart::Server do
  describe "#deployable?" do
    context "with deployable server" do
      let(:server) { Bart::Server.new :status => :up }

      it "should return true if status is UP" do
        server.deployable?.should be_true
      end
    end

    context "with not deployable server" do
      let(:server) { Bart::Server.new :status => :down }

      it "should return false if status is DOWN" do
        server.deployable?.should be_false
      end
    end
  end
end
      
