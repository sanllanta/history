require 'rails_helper'

RSpec.describe "engravings/edit", :type => :view do
  before(:each) do
    @engraving = assign(:engraving, Engraving.create!(
      :name => "MyText"
    ))
  end

  it "renders the edit engraving form" do
    render

    assert_select "form[action=?][method=?]", engraving_path(@engraving), "post" do

      assert_select "textarea#engraving_name[name=?]", "engraving[name]"
    end
  end
end
