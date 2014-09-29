require 'rails_helper'

RSpec.describe "donors/new", :type => :view do
  before(:each) do
    assign(:donor, Donor.new(
      :name => "MyString"
    ))
  end

  it "renders new donor form" do
    render

    assert_select "form[action=?][method=?]", donors_path, "post" do

      assert_select "input#donor_name[name=?]", "donor[name]"
    end
  end
end
