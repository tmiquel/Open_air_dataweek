# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topic, type: :model do
  before(:each) do
    @topic = FactoryBot.build(:topic, :with_main_picture)
  end

  it 'has a valid factory' do
    expect(@topic).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@topic).to be_a(Topic)
    end

    describe '#title' do
      it { expect(@topic).to validate_presence_of(:title) }
      it { expect(@topic).to validate_uniqueness_of :title }
    end

    describe '#short_description' do
      it { expect(@topic).to validate_presence_of(:short_description) }
      it { expect(@topic).to validate_uniqueness_of(:short_description) }
    end

    describe '#driver_section_title' do
      it { expect(@topic).to validate_presence_of(:driver_section_title) }
    end

    describe '#pressure_section_title' do
      it { expect(@topic).to validate_presence_of(:pressure_section_title) }
    end

    describe '#state_section_title' do
      it { expect(@topic).to validate_presence_of(:state_section_title) }
    end

    describe '#impact_section_title' do
      it { expect(@topic).to validate_presence_of(:impact_section_title) }
    end

    describe '#response_section_title' do
      it { expect(@topic).to validate_presence_of(:response_section_title) }
    end
  end
end
