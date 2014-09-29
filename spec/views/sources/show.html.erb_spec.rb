require 'rails_helper'

RSpec.describe "sources/show", :type => :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
