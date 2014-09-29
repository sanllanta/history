require 'rails_helper'

RSpec.describe "story_types/new", :type => :view do
  before(:each) do
    assign(:story_type, StoryType.new(
      :name => "MyString"
    ))
  end

  it "renders new story_type form" do
    render

    assert_select "form[action=?][method=?]", story_types_path, "post" do

      assert_select "input#story_type_name[name=?]", "story_type[name]"
    end
  end
end
