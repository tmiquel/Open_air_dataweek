# frozen_string_literal: true

class RemoveFieldNameFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :text
  end
end
