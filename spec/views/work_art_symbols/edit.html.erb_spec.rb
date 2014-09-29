require 'rails_helper'

RSpec.describe "work_art_symbols/edit", :type => :view do
  before(:each) do
    @work_art_symbol = assign(:work_art_symbol, WorkArtSymbol.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit work_art_symbol form" do
    render

    assert_select "form[action=?][method=?]", work_art_symbol_path(@work_art_symbol), "post" do

      assert_select "input#work_art_symbol_name[name=?]", "work_art_symbol[name]"
    end
  end
end
