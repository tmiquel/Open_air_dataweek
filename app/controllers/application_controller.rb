class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
    def index
        @topics = Topic.with_attached_main_picture.all
        @marseille_indice = AtmoSud.new.marseille_air_indice
        @toulon_indice = AtmoSud.new.toulon_air_indice
        @nice_indice = AtmoSud.new.nice_air_indice
    end


	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
