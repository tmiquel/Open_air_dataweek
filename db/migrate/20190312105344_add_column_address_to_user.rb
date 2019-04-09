# frozen_string_literal: true

class AddColumnAddressToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :text
  end
end
