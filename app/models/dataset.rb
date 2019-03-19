class Dataset < ApplicationRecord
	belongs_to :topic
	
	validates :title, presence: true
	validates :db_link, presence: true
	validates :description, presence: true
	validates :dpsir_category, presence: true
	validates :dpsir_category, :inclusion => { :in => ['Driver', 'Pressure', 'State', 'Impact', 'Response'] }
	validates :rendered, presence: true
	validates :file_type, presence: true

end
