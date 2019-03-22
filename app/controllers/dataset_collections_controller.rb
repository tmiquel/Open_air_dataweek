class DatasetCollectionsController < ApplicationController
  before_action :access_my_collection_only

  def show
    @datasets = []
    DatasetCollection.where(user: current_user).each do |dataset|
      @datasets << dataset.dataset
    end
  end

	def create
		@user = User.find(params[:user_id])
		@dataset = Dataset.find(params[:dataset])
		@dataset_collection = DatasetCollection.new(user: @user, dataset: @dataset)
		respond_to do |format|

			format.js
			format.html do
					redirect_to user_dataset_collection_path(current_user), notice: "donnée enregistrée avec succès"
			end
			format.json
  	end

	end

	def destroy
		@user = DatasetCollection.find(params[:user_id])
		@dataset = Dataset.find(params[:dataset])
		@dataset_collection = DatasetCollection.where(user: @user).where(dataset: @dataset).first
		@dataset_collection.destroy
 
    respond_to do |format|
			format.js
			format.html do
				redirect_to user_dataset_collection_path(current_user), notice: "donnée correctement supprimée"
			end
      format.json
  	end

	end

private

  def access_my_collection_only
    unless ((current_user) && (params[:user_id].to_i == current_user.id))
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
  end

end
