require "rails_helper"

RSpec.describe PhylacteryBillboardsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/phylactery_billboards").to route_to("phylactery_billboards#index")
    end

    it "routes to #new" do
      expect(:get => "/phylactery_billboards/new").to route_to("phylactery_billboards#new")
    end

    it "routes to #show" do
      expect(:get => "/phylactery_billboards/1").to route_to("phylactery_billboards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/phylactery_billboards/1/edit").to route_to("phylactery_billboards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/phylactery_billboards").to route_to("phylactery_billboards#create")
    end

    it "routes to #update" do
      expect(:put => "/phylactery_billboards/1").to route_to("phylactery_billboards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/phylactery_billboards/1").to route_to("phylactery_billboards#destroy", :id => "1")
    end

  end
end
