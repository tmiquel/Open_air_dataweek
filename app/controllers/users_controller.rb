class UsersController < ApplicationController
	before_action :access_my_collection_only

  def ma_collection
		@user_id = params[:id]
		@datasets = DatasetCollection.where(user: @user_id)
  end

private

	def access_my_collection_only
    unless (current_user && @user_id == current_user.id)
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
	end

end
