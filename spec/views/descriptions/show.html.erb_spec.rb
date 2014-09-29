require 'rails_helper'

RSpec.describe "descriptions/show", :type => :view do
  before(:each) do
    @description = assign(:description, Description.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
