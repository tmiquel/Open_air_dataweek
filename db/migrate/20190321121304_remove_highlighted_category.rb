# frozen_string_literal: true

class RemoveHighlightedCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :highlighted_category, :string
  end
end
