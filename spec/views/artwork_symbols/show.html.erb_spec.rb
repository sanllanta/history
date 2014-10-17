require 'rails_helper'

RSpec.describe "artwork_symbols/show", :type => :view do
  before(:each) do
    @artwork_symbol = assign(:artwork_symbol, ArtworkSymbol.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
