require 'rails_helper'

RSpec.describe "descriptions/new", :type => :view do
  before(:each) do
    assign(:description, Description.new(
      :description => "MyString"
    ))
  end

  it "renders new description form" do
    render

    assert_select "form[action=?][method=?]", descriptions_path, "post" do

      assert_select "input#description_description[name=?]", "description[description]"
    end
  end
end
