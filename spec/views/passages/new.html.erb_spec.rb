require 'rails_helper'

RSpec.describe "passages/new", :type => :view do
  before(:each) do
    assign(:passage, Passage.new(
      :name => "MyString"
    ))
  end

  it "renders new passage form" do
    render

    assert_select "form[action=?][method=?]", passages_path, "post" do

      assert_select "input#passage_name[name=?]", "passage[name]"
    end
  end
end
