class CreateDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|

      t.timestamps
			t.belongs_to :topic, index: true
			t.string :title
			t.string :db_link
			t.string :dpsir_category
			t.text :description

    end
  end
end
