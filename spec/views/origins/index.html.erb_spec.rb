require 'rails_helper'

RSpec.describe "origins/index", :type => :view do
  before(:each) do
    assign(:origins, [
      Origin.create!(
        :name => "Name"
      ),
      Origin.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of origins" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
