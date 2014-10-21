require "rails_helper"

RSpec.describe IconographicAttributesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/iconographic_attributes").to route_to("iconographic_attributes#index")
    end

    it "routes to #new" do
      expect(:get => "/iconographic_attributes/new").to route_to("iconographic_attributes#new")
    end

    it "routes to #show" do
      expect(:get => "/iconographic_attributes/1").to route_to("iconographic_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/iconographic_attributes/1/edit").to route_to("iconographic_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/iconographic_attributes").to route_to("iconographic_attributes#create")
    end

    it "routes to #update" do
      expect(:put => "/iconographic_attributes/1").to route_to("iconographic_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/iconographic_attributes/1").to route_to("iconographic_attributes#destroy", :id => "1")
    end

  end
end
