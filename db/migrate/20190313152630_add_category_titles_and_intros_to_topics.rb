class AddCategoryTitlesAndIntrosToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :driver_section_title, :string
    add_column :topics, :driver_section_intro, :text
    add_column :topics, :pressure_section_title, :string
    add_column :topics, :pressure_section_intro, :text
    add_column :topics, :state_section_title, :string
    add_column :topics, :state_section_intro, :text
    add_column :topics, :impact_section_title, :string
    add_column :topics, :impact_section_intro, :text
    add_column :topics, :response_section_title, :string
    add_column :topics, :response_section_intro, :text
  end
end
