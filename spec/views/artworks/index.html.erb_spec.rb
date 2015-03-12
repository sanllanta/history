require 'rails_helper'

RSpec.describe "artworks/index", :type => :view do
  before(:each) do
    assign(:artworks, [
      Artwork.create!(
        :authors => "Author",
        :activity => "Activity",
        :biographic_data => "MyText",
        :signed => "MyText",
        :synthesis => "MyText",
        :biographic_comment => "MyText",
        :annotation => "MyText",
        :sub_image => "MyText",
        :comment => "MyText"
      ),
      Artwork.create!(
        :authors => "Author",
        :activity => "Activity",
        :biographic_data => "MyText",
        :signed => "MyText",
        :synthesis => "MyText",
        :biographic_comment => "MyText",
        :annotation => "MyText",
        :sub_image => "MyText",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of artworks" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
