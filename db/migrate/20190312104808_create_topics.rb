class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :short_
      t.text :description

      t.timestamps
    end
  end
end
