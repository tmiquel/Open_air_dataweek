require 'rails_helper'

RSpec.describe "test_boomerangs/show", type: :view do
  before(:each) do
    @test_boomerang = assign(:test_boomerang, TestBoomerang.create!(
      :index => "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
  end
end
