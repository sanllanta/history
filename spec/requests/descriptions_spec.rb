require 'rails_helper'

RSpec.describe "Descriptions", :type => :request do
  describe "GET /descriptions" do
    it "works! (now write some real specs)" do
      get descriptions_path
      expect(response.status).to be(200)
    end
  end
end
