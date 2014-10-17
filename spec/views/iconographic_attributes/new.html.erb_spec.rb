require 'rails_helper'

RSpec.describe "iconographic_attributes/new", :type => :view do
  before(:each) do
    assign(:iconographic_attribute, IconographicAttribute.new(
      :name => "MyString"
    ))
  end

  it "renders new iconographic_attribute form" do
    render

    assert_select "form[action=?][method=?]", iconographic_attributes_path, "post" do

      assert_select "input#iconographic_attribute_name[name=?]", "iconographic_attribute[name]"
    end
  end
end
