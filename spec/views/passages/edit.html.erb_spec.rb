require 'rails_helper'

RSpec.describe "passages/edit", :type => :view do
  before(:each) do
    @passage = assign(:passage, Passage.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit passage form" do
    render

    assert_select "form[action=?][method=?]", passage_path(@passage), "post" do

      assert_select "input#passage_name[name=?]", "passage[name]"
    end
  end
end
