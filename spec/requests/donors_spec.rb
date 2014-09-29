require 'rails_helper'

RSpec.describe "Donors", :type => :request do
  describe "GET /donors" do
    it "works! (now write some real specs)" do
      get donors_path
      expect(response.status).to be(200)
    end
  end
end
