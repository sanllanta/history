require 'rails_helper'

RSpec.describe "Artworks", :type => :request do
  describe "GET /artworks" do
    it "works! (now write some real specs)" do
      get artworks_path
      expect(response.status).to be(200)
    end
  end
end
