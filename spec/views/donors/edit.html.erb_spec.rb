require 'rails_helper'

RSpec.describe "donors/edit", :type => :view do
  before(:each) do
    @donor = assign(:donor, Donor.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit donor form" do
    render

    assert_select "form[action=?][method=?]", donor_path(@donor), "post" do

      assert_select "input#donor_name[name=?]", "donor[name]"
    end
  end
end
