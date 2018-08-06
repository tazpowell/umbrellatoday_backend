require "rails_helper"

RSpec.describe ForecastsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/forecasts").to route_to("forecasts#index")
    end


    it "routes to #show" do
      expect(:get => "/forecasts/1").to route_to("forecasts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/forecasts").to route_to("forecasts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/forecasts/1").to route_to("forecasts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/forecasts/1").to route_to("forecasts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/forecasts/1").to route_to("forecasts#destroy", :id => "1")
    end

  end
end
