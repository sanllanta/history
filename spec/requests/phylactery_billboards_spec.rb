require 'rails_helper'

RSpec.describe "PhylacteryBillboards", :type => :request do
  describe "GET /phylactery_billboards" do
    it "works! (now write some real specs)" do
      get phylactery_billboards_path
      expect(response.status).to be(200)
    end
  end
end
