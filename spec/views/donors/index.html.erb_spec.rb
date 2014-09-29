require 'rails_helper'

RSpec.describe "donors/index", :type => :view do
  before(:each) do
    assign(:donors, [
      Donor.create!(
        :name => "Name"
      ),
      Donor.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of donors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
