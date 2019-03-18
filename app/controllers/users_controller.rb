class UsersController < ApplicationController
	def index
		@user = User.all
	end 

	def edit
	end

	def update
	end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
end

end
