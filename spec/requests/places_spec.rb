require 'rails_helper'

RSpec.describe "Places", :type => :request do
  describe "GET /places" do
    it "works! (now write some real specs)" do
      get places_path
      expect(response.status).to be(200)
    end
  end
end
