require 'rails_helper'

RSpec.describe "iconographic_attributes/show", :type => :view do
  before(:each) do
    @iconographic_attribute = assign(:iconographic_attribute, IconographicAttribute.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
