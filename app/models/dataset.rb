class Dataset < ApplicationRecord
	belongs_to :topic
	has_many :dataset_collections
	
	validates :title, presence: true
	validates :db_link, presence: true
	validates :description, presence: true
	validates :dpsir_category, presence: true
	validates :dpsir_category, :inclusion => { :in => ['Driver', 'Pressure', 'State', 'Impact', 'Response'] }
	validates_inclusion_of :rendered, in: [true, false]
	validates :file_type, presence: true

end
