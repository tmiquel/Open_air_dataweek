# frozen_string_literal: true

FactoryBot.define do
  factory :dataset_collection do
    user { FactoryBot.create(:user) }
    dataset { FactoryBot.create(:dataset) }
  end
end
