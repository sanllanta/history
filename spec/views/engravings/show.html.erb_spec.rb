require 'rails_helper'

RSpec.describe "engravings/show", :type => :view do
  before(:each) do
    @engraving = assign(:engraving, Engraving.create!(
      :name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
