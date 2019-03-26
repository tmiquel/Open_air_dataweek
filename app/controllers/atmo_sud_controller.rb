class AtmoSudController < ApplicationController
	def index 
		@atmos = AtmoSud.new
		@atmo_city = AtmoSud.new.city_air_indice
		
	end

	def show 
		@atmos = AtmoSud.new.city(params[:search])
	end
	def create
		@atmos = AtmoSud.new.city(params[:search])
		redirect_to atmo_sud_path(params[:search])
	end

	  def search
    lookup = params[:lookup]

  end

end
