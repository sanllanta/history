require 'rails_helper'

RSpec.describe "phylactery_billboards/show", :type => :view do
  before(:each) do
    @phylactery_billboard = assign(:phylactery_billboard, PhylacteryBillboard.create!(
      :name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
