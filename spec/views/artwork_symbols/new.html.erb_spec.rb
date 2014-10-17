require 'rails_helper'

RSpec.describe "artwork_symbols/new", :type => :view do
  before(:each) do
    assign(:artwork_symbol, ArtworkSymbol.new())
  end

  it "renders new artwork_symbol form" do
    render

    assert_select "form[action=?][method=?]", artwork_symbols_path, "post" do
    end
  end
end
