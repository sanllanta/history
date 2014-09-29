require 'rails_helper'

RSpec.describe "origins/edit", :type => :view do
  before(:each) do
    @origin = assign(:origin, Origin.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit origin form" do
    render

    assert_select "form[action=?][method=?]", origin_path(@origin), "post" do

      assert_select "input#origin_name[name=?]", "origin[name]"
    end
  end
end
