require 'rails_helper'

RSpec.describe "story_types/show", :type => :view do
  before(:each) do
    @story_type = assign(:story_type, StoryType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
