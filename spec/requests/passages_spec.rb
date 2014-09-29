require 'rails_helper'

RSpec.describe "Passages", :type => :request do
  describe "GET /passages" do
    it "works! (now write some real specs)" do
      get passages_path
      expect(response.status).to be(200)
    end
  end
end
