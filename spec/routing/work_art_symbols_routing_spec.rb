require "rails_helper"

RSpec.describe WorkArtSymbolsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/work_art_symbols").to route_to("work_art_symbols#index")
    end

    it "routes to #new" do
      expect(:get => "/work_art_symbols/new").to route_to("work_art_symbols#new")
    end

    it "routes to #show" do
      expect(:get => "/work_art_symbols/1").to route_to("work_art_symbols#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/work_art_symbols/1/edit").to route_to("work_art_symbols#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/work_art_symbols").to route_to("work_art_symbols#create")
    end

    it "routes to #update" do
      expect(:put => "/work_art_symbols/1").to route_to("work_art_symbols#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/work_art_symbols/1").to route_to("work_art_symbols#destroy", :id => "1")
    end

  end
end
