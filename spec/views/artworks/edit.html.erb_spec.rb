require 'rails_helper'

RSpec.describe "artworks/edit", :type => :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      :authors => "MyString",
      :activity => "MyString",
      :biographic_data => "MyText",
      :signed => "MyText",
      :synthesis => "MyText",
      :biographic_comment => "MyText",
      :annotation => "MyText",
      :sub_image => "MyText",
      :comment => "MyText"
    ))
  end

  it "renders the edit artwork form" do
    render

    assert_select "form[action=?][method=?]", artwork_path(@artwork), "post" do

      assert_select "input#artwork_author[name=?]", "artwork[author]"

      assert_select "input#artwork_activity[name=?]", "artwork[activity]"

      assert_select "textarea#artwork_biographic_data[name=?]", "artwork[biographic_data]"

      assert_select "textarea#artwork_signed[name=?]", "artwork[signed]"

      assert_select "textarea#artwork_synthesis[name=?]", "artwork[synthesis]"

      assert_select "textarea#artwork_biographic_comment[name=?]", "artwork[biographic_comment]"

      assert_select "textarea#artwork_annotation[name=?]", "artwork[annotation]"

      assert_select "textarea#artwork_sub_image[name=?]", "artwork[sub_image]"

      assert_select "textarea#artwork_comment[name=?]", "artwork[comment]"
    end
  end
end
