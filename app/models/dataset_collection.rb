# frozen_string_literal: true

class DatasetCollection < ApplicationRecord
  belongs_to :user
  belongs_to :dataset

  validates :user, presence: true
  validates :dataset, presence: true
  validate :only_one_dataset_per_user

  private

  def only_one_dataset_per_user
    DatasetCollection.all.each do |dataset_collection_elmt|
      errors.add(:dataset, 'Vous avez déjà enregistré ce jeu de données') if (dataset_collection_elmt.dataset == dataset) && (dataset_collection_elmt.user == user) && (dataset_collection_elmt != self)
    end
  end
end
