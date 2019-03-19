class AddColumnToDatasets < ActiveRecord::Migration[5.2]
  def change
    add_column :datasets, :rendered, :boolean
    add_column :datasets, :file_type, :string
  end
end
