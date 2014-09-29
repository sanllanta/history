require 'rails_helper'

RSpec.describe "passages/show", :type => :view do
  before(:each) do
    @passage = assign(:passage, Passage.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
