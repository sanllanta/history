require 'rails_helper'

RSpec.describe "engravings/new", :type => :view do
  before(:each) do
    assign(:engraving, Engraving.new(
      :name => "MyText"
    ))
  end

  it "renders new engraving form" do
    render

    assert_select "form[action=?][method=?]", engravings_path, "post" do

      assert_select "textarea#engraving_name[name=?]", "engraving[name]"
    end
  end
end
