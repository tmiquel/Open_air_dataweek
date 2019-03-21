class Topic < ApplicationRecord

	has_one_attached :main_picture
	has_many :datasets

	validates :title, presence: true, uniqueness: true
	validates :short_description, presence: true, uniqueness: true
	validate :main_picture_presence
	validates :main_picture, file_size: { less_than_or_equal_to: 5000.kilobytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }
    validates :driver_section_title, presence: true
    validates :pressure_section_title, presence: true
    validates :state_section_title, presence: true
    validates :impact_section_title, presence: true
    validates :response_section_title, presence: true
  

  def main_picture_presence
    errors.add(:main_picture, "is not present") unless self.main_picture.attached?
  end

  def get_datasets_by_categories
    driver_datasets = self.datasets.select{|dataset| dataset.dpsir_category == "Driver"}
    pressure_datasets = self.datasets.select{|dataset| dataset.dpsir_category == "Pressure"}
    state_datasets = self.datasets.select{|dataset| dataset.dpsir_category == "State"}
    impact_datasets = self.datasets.select{|dataset| dataset.dpsir_category == "Impact"}
    response_datasets = self.datasets.select{|dataset| dataset.dpsir_category == "Response"}
    [driver_datasets, pressure_datasets, state_datasets, impact_datasets, response_datasets]
  end

end
