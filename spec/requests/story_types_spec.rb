require 'rails_helper'

RSpec.describe "StoryTypes", :type => :request do
  describe "GET /story_types" do
    it "works! (now write some real specs)" do
      get story_types_path
      expect(response.status).to be(200)
    end
  end
end
