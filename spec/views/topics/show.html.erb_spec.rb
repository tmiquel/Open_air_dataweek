require 'rails_helper'

RSpec.describe 'topics/show', type: :view do
  before(:each) do
    @topic = FactoryBot.build(:topic, :with_main_picture)
    @topics = [@topic]
  end

  it 'renders topics with titles and short intros for each category' do
    render
    expect(rendered).to have_content @topic.driver_section_title
    expect(rendered).to have_content @topic.driver_section_intro
    expect(rendered).to have_content @topic.pressure_section_title
    expect(rendered).to have_content @topic.impact_section_title
    expect(rendered).to have_content @topic.state_section_title
    expect(rendered).to have_content @topic.response_section_title
    expect(rendered).to have_content @topic.pressure_section_intro
    expect(rendered).to have_content @topic.impact_section_intro
    expect(rendered).to have_content @topic.state_section_intro
    expect(rendered).to have_content @topic.response_section_intro
  end
end