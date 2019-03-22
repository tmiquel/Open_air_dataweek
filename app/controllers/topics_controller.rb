class TopicsController < ApplicationController

    def index
        @topics = Topic.with_attached_main_picture.all
    end

    def show
        @topic = Topic.with_attached_main_picture.find(params[:id])
        @related_topics = Topic.all.sample(3)
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
