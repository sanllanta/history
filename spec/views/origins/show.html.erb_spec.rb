require 'rails_helper'

RSpec.describe "origins/show", :type => :view do
  before(:each) do
    @origin = assign(:origin, Origin.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
