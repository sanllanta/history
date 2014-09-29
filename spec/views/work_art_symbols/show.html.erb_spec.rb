require 'rails_helper'

RSpec.describe "work_art_symbols/show", :type => :view do
  before(:each) do
    @work_art_symbol = assign(:work_art_symbol, WorkArtSymbol.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
