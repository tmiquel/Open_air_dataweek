# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'topics/index', type: :view do
  before(:each) do
    @topic = FactoryBot.create(:topic, :with_main_picture)
    @topics = [@topic]
  end

  it 'renders topics with title and short description' do
    render
    expect(rendered).to have_content @topic.title
    expect(rendered).to have_content @topic.short_description
  end
end
