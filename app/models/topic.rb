class Topic < ApplicationRecord

	has_one_attached :main_picture

	validates :title, presence: true, uniqueness: true
	validates :short_description, presence: true, uniqueness: true
	validates :highlighted_category, presence: true
	validate :main_picture_presence, on: :create
	validates :highlighted_category, :inclusion => { :in => ['Driver', 'Pressure', 'State', 'Impact', 'Response'] }
	validates :main_picture, file_size: { less_than_or_equal_to: 5000.kilobytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }

  def main_picture_presence
    errors.add(:main_picture, "is not present") unless self.main_picture.attached?
  end



end
