require 'rails_helper'

RSpec.describe "work_art_symbols/index", :type => :view do
  before(:each) do
    assign(:work_art_symbols, [
      WorkArtSymbol.create!(
        :name => "Name"
      ),
      WorkArtSymbol.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of work_art_symbols" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
