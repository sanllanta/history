require 'rails_helper'

RSpec.describe "scenes/index", :type => :view do
  before(:each) do
    assign(:scenes, [
      Scene.create!(
        :name => "Name"
      ),
      Scene.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of scenes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
