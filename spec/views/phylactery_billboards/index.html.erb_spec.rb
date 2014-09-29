require 'rails_helper'

RSpec.describe "phylactery_billboards/index", :type => :view do
  before(:each) do
    assign(:phylactery_billboards, [
      PhylacteryBillboard.create!(
        :name => "MyText"
      ),
      PhylacteryBillboard.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of phylactery_billboards" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
