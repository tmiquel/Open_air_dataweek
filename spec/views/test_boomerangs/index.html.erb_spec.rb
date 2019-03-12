require 'rails_helper'

RSpec.describe "test_boomerangs/index", type: :view do
  before(:each) do
    assign(:test_boomerangs, [
      TestBoomerang.create!(
        :index => "Index"
      ),
      TestBoomerang.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of test_boomerangs" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
