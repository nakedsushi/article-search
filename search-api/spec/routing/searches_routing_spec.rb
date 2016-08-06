require "rails_helper"

RSpec.describe SearchesController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/searches").to route_to("searches#create")
    end
  end
end
