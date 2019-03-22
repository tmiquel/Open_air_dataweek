# frozen_string_literal: true

class CreateDatasetCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :dataset_collections do |t|
      t.belongs_to :user, :dataset, index: true

      t.timestamps
    end
  end
end
