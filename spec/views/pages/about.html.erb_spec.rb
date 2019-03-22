# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/about', type: :view do
  it 'renders "Open Air"' do
    render
    expect(rendered).to have_content 'Open Air'
  end
end
