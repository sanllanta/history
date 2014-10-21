require 'rails_helper'

RSpec.describe "iconographic_attributes/edit", :type => :view do
  before(:each) do
    @iconographic_attribute = assign(:iconographic_attribute, IconographicAttribute.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit iconographic_attribute form" do
    render

    assert_select "form[action=?][method=?]", iconographic_attribute_path(@iconographic_attribute), "post" do

      assert_select "input#iconographic_attribute_name[name=?]", "iconographic_attribute[name]"
    end
  end
end
