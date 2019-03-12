class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :short_description
      t.string :highlighted_category

      has_one_attached :picture_file

      t.timestamps
    end
  end
end
