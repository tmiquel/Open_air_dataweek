class CreateTestBoomerangs < ActiveRecord::Migration[5.2]
  def change
    create_table :test_boomerangs do |t|
      t.string :index

      t.timestamps
    end
  end
end
