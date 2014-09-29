require 'rails_helper'

RSpec.describe "story_types/edit", :type => :view do
  before(:each) do
    @story_type = assign(:story_type, StoryType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit story_type form" do
    render

    assert_select "form[action=?][method=?]", story_type_path(@story_type), "post" do

      assert_select "input#story_type_name[name=?]", "story_type[name]"
    end
  end
end
