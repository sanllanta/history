require 'rails_helper'

RSpec.describe "story_types/index", :type => :view do
  before(:each) do
    assign(:story_types, [
      StoryType.create!(
        :name => "Name"
      ),
      StoryType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of story_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
