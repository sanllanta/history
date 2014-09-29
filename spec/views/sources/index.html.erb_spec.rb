require 'rails_helper'

RSpec.describe "sources/index", :type => :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        :name => "Name"
      ),
      Source.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
