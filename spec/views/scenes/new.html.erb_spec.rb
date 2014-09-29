require 'rails_helper'

RSpec.describe "scenes/new", :type => :view do
  before(:each) do
    assign(:scene, Scene.new(
      :name => "MyString"
    ))
  end

  it "renders new scene form" do
    render

    assert_select "form[action=?][method=?]", scenes_path, "post" do

      assert_select "input#scene_name[name=?]", "scene[name]"
    end
  end
end
