require 'rails_helper'

RSpec.describe "descriptions/index", :type => :view do
  before(:each) do
    assign(:descriptions, [
      Description.create!(
        :description => "Description"
      ),
      Description.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
