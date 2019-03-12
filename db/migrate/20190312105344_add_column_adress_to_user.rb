class AddColumnAdressToUser < ActiveRecord::Migration[5.2]
  def change
		add_column :users, :adress, :text
  end
end
