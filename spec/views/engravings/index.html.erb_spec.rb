require 'rails_helper'

RSpec.describe "engravings/index", :type => :view do
  before(:each) do
    assign(:engravings, [
      Engraving.create!(
        :name => "MyText"
      ),
      Engraving.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of engravings" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
