require 'rails_helper'

RSpec.describe "iconographic_attributes/index", :type => :view do
  before(:each) do
    assign(:iconographic_attributes, [
      IconographicAttribute.create!(
        :name => "Name"
      ),
      IconographicAttribute.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of iconographic_attributes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
