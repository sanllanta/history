require 'rails_helper'

RSpec.describe "artwork_symbols/index", :type => :view do
  before(:each) do
    assign(:artwork_symbols, [
      ArtworkSymbol.create!(),
      ArtworkSymbol.create!()
    ])
  end

  it "renders a list of artwork_symbols" do
    render
  end
end
