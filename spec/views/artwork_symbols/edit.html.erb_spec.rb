require 'rails_helper'

RSpec.describe "artwork_symbols/edit", :type => :view do
  before(:each) do
    @artwork_symbol = assign(:artwork_symbol, ArtworkSymbol.create!())
  end

  it "renders the edit artwork_symbol form" do
    render

    assert_select "form[action=?][method=?]", artwork_symbol_path(@artwork_symbol), "post" do
    end
  end
end
