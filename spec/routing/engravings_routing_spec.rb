require "rails_helper"

RSpec.describe EngravingsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/engravings").to route_to("engravings#index")
    end

    it "routes to #new" do
      expect(:get => "/engravings/new").to route_to("engravings#new")
    end

    it "routes to #show" do
      expect(:get => "/engravings/1").to route_to("engravings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/engravings/1/edit").to route_to("engravings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/engravings").to route_to("engravings#create")
    end

    it "routes to #update" do
      expect(:put => "/engravings/1").to route_to("engravings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/engravings/1").to route_to("engravings#destroy", :id => "1")
    end

  end
end
