require 'rails_helper'

RSpec.describe "phylactery_billboards/edit", :type => :view do
  before(:each) do
    @phylactery_billboard = assign(:phylactery_billboard, PhylacteryBillboard.create!(
      :name => "MyText"
    ))
  end

  it "renders the edit phylactery_billboard form" do
    render

    assert_select "form[action=?][method=?]", phylactery_billboard_path(@phylactery_billboard), "post" do

      assert_select "textarea#phylactery_billboard_name[name=?]", "phylactery_billboard[name]"
    end
  end
end
