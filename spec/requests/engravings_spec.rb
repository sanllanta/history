require 'rails_helper'

RSpec.describe "Engravings", :type => :request do
  describe "GET /engravings" do
    it "works! (now write some real specs)" do
      get engravings_path
      expect(response.status).to be(200)
    end
  end
end
