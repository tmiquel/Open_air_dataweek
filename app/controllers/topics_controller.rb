class TopicsController < ApplicationController

    def index
        @topics = Topic.with_attached_main_picture.all
        @marseille_indice = AtmoSud.new.marseille_air_indice
        @toulon_indice = AtmoSud.new.toulon_air_indice
        @nice_indice = AtmoSud.new.nice_air_indice
    end

    def show
        @topic = Topic.with_attached_main_picture.find(params[:id])
        @related_topics = []
        3.times do
            @related_topics << Topic.all.sample
        end
        @driver_datasets, 
        @pressure_datasets, 
        @state_datasets, 
        @impact_datasets, 
        @response_datasets  = @topic.get_datasets_by_categories
				if current_user
					@user_dataset_collection = []
					DatasetCollection.where(user: current_user).each do |datasetcollection|
						@user_dataset_collection << datasetcollection.dataset
					end
				end
    end

    def create
        
    end

    def update
        
    end

end
