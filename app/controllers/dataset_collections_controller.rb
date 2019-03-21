class DatasetCollectionsController < ApplicationController
  before_action :access_my_collection_only

  def show
    @datasets = []
    DatasetCollection.where(user: current_user).each do |dataset|
      @datasets << dataset.dataset
    end
  end

	def create
		dataset_collection = DatasetCollection.new(user: User.find(params[:user_id]), dataset: Dataset.find(params[:dataset]))
		if dataset_collection.save
			redirect_to user_dataset_collection_path(current_user)
		else
			redirect_to root_path
		end
	end

	def destroy
		@dataset_collection = DatasetCollection.where(user: DatasetCollection.find(params[:user_id])).where(dataset: Dataset.find(params[:dataset])).first
		@dataset_collection.destroy
		redirect_to user_dataset_collection_path(current_user)
	end

private

  def access_my_collection_only
    unless ((current_user) && (params[:user_id].to_i == current_user.id))
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
  end
end
