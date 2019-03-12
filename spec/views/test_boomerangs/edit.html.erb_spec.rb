require 'rails_helper'

RSpec.describe "test_boomerangs/edit", type: :view do
  before(:each) do
    @test_boomerang = assign(:test_boomerang, TestBoomerang.create!(
      :index => "MyString"
    ))
  end

  it "renders the edit test_boomerang form" do
    render

    assert_select "form[action=?][method=?]", test_boomerang_path(@test_boomerang), "post" do

      assert_select "input[name=?]", "test_boomerang[index]"
    end
  end
end
