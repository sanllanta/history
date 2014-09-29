require 'rails_helper'

RSpec.describe "origins/new", :type => :view do
  before(:each) do
    assign(:origin, Origin.new(
      :name => "MyString"
    ))
  end

  it "renders new origin form" do
    render

    assert_select "form[action=?][method=?]", origins_path, "post" do

      assert_select "input#origin_name[name=?]", "origin[name]"
    end
  end
end
