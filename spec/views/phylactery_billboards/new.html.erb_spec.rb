require 'rails_helper'

RSpec.describe "phylactery_billboards/new", :type => :view do
  before(:each) do
    assign(:phylactery_billboard, PhylacteryBillboard.new(
      :name => "MyText"
    ))
  end

  it "renders new phylactery_billboard form" do
    render

    assert_select "form[action=?][method=?]", phylactery_billboards_path, "post" do

      assert_select "textarea#phylactery_billboard_name[name=?]", "phylactery_billboard[name]"
    end
  end
end
