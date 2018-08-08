require "rails_helper"

RSpec.describe CoordinatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coordinates").to route_to("coordinates#index")
    end


    it "routes to #show" do
      expect(:get => "/coordinates/1").to route_to("coordinates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/coordinates").to route_to("coordinates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/coordinates/1").to route_to("coordinates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/coordinates/1").to route_to("coordinates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coordinates/1").to route_to("coordinates#destroy", :id => "1")
    end

  end
end
