require "rails_helper"

RSpec.describe TestBoomerangsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/test_boomerangs").to route_to("test_boomerangs#index")
    end

    it "routes to #new" do
      expect(:get => "/test_boomerangs/new").to route_to("test_boomerangs#new")
    end

    it "routes to #show" do
      expect(:get => "/test_boomerangs/1").to route_to("test_boomerangs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_boomerangs/1/edit").to route_to("test_boomerangs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/test_boomerangs").to route_to("test_boomerangs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/test_boomerangs/1").to route_to("test_boomerangs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/test_boomerangs/1").to route_to("test_boomerangs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_boomerangs/1").to route_to("test_boomerangs#destroy", :id => "1")
    end
  end
end
