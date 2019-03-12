require 'rails_helper'

RSpec.describe "test_boomerangs/new", type: :view do
  before(:each) do
    assign(:test_boomerang, TestBoomerang.new(
      :index => "MyString"
    ))
  end

  it "renders new test_boomerang form" do
    render

    assert_select "form[action=?][method=?]", test_boomerangs_path, "post" do

      assert_select "input[name=?]", "test_boomerang[index]"
    end
  end
end
