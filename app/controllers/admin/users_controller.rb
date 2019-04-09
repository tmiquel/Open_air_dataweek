class Admin::UsersController < ApplicationController
before_action :is_admin?

	def index
		@user = User.all
	end 

	def edit
			@user = User.find(params[:id])
    @user.update

	end

	def update
	@user = User.find(params[:id])
    @user.update

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      end
	end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      
      
    end
end

end
