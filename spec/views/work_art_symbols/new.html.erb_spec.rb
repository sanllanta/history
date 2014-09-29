require 'rails_helper'

RSpec.describe "work_art_symbols/new", :type => :view do
  before(:each) do
    assign(:work_art_symbol, WorkArtSymbol.new(
      :name => "MyString"
    ))
  end

  it "renders new work_art_symbol form" do
    render

    assert_select "form[action=?][method=?]", work_art_symbols_path, "post" do

      assert_select "input#work_art_symbol_name[name=?]", "work_art_symbol[name]"
    end
  end
end
