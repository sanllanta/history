require 'rails_helper'

RSpec.describe "artworks/show", :type => :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      :authors => "Author",
      :activity => "Activity",
      :biographic_data => "MyText",
      :signed => "MyText",
      :synthesis => "MyText",
      :biographic_comment => "MyText",
      :annotation => "MyText",
      :sub_image => "MyText",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Activity/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
