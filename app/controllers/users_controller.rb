class UsersController < ApplicationController
	before_action :access_my_collection_only

  def ma_collection
		@datasets = []
		DatasetCollection.where(user: current_user).each do |dataset|
			@datasets << dataset.dataset
		end
  end

private

	def access_my_collection_only
    unless ((current_user) && (params[:id].to_i == current_user.id))
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
	end

end
