class Dataset < ApplicationRecord
	belongs_to :topic
	
	validates :title, presence: true
	validates :db_link, presence: true
	validates :description, presence: true
	validates :dpsir_category, presence: true
	validates :dpsir_category, :inclusion => { :in => ['Driver', 'Pressure', 'State', 'Impact', 'Response'] }
	validates_inclusion_of :rendered, in: [true, false]
	validates :file_type, presence: true

	def get_iframe_string(width, height, src)
		"iframe = <iframe width= #{width} height= #{height} src= #{scr} frameBorder=\"0\"></iframe>"
	end
	# helper_method :get_iframe_string

end
