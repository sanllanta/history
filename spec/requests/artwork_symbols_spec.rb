require 'rails_helper'

RSpec.describe "ArtworkSymbols", :type => :request do
  describe "GET /artwork_symbols" do
    it "works! (now write some real specs)" do
      get artwork_symbols_path
      expect(response.status).to be(200)
    end
  end
end
