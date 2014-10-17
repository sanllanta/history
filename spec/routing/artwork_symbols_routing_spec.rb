require "rails_helper"

RSpec.describe ArtworkSymbolsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/artwork_symbols").to route_to("artwork_symbols#index")
    end

    it "routes to #new" do
      expect(:get => "/artwork_symbols/new").to route_to("artwork_symbols#new")
    end

    it "routes to #show" do
      expect(:get => "/artwork_symbols/1").to route_to("artwork_symbols#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/artwork_symbols/1/edit").to route_to("artwork_symbols#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/artwork_symbols").to route_to("artwork_symbols#create")
    end

    it "routes to #update" do
      expect(:put => "/artwork_symbols/1").to route_to("artwork_symbols#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/artwork_symbols/1").to route_to("artwork_symbols#destroy", :id => "1")
    end

  end
end
