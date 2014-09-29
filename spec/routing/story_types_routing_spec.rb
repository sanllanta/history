require "rails_helper"

RSpec.describe StoryTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/story_types").to route_to("story_types#index")
    end

    it "routes to #new" do
      expect(:get => "/story_types/new").to route_to("story_types#new")
    end

    it "routes to #show" do
      expect(:get => "/story_types/1").to route_to("story_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/story_types/1/edit").to route_to("story_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/story_types").to route_to("story_types#create")
    end

    it "routes to #update" do
      expect(:put => "/story_types/1").to route_to("story_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/story_types/1").to route_to("story_types#destroy", :id => "1")
    end

  end
end
