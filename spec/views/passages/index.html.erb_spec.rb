require 'rails_helper'

RSpec.describe "passages/index", :type => :view do
  before(:each) do
    assign(:passages, [
      Passage.create!(
        :name => "Name"
      ),
      Passage.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of passages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
