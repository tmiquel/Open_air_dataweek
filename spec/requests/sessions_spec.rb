require 'rails_helper'
RSpec.describe "Sessions" do

	before(:each) do
    @user = FactoryBot.create(:user)
	end

  it "signs user in and out" do
    sign_in @user
    get root_path
    expect(response).to render_template(:index) 
    
    sign_out @user
    get root_path
    expect(response).not_to render_template(:index) 
  end

	it "sould set a current_user after sign_in" do
		sign_in @user
		expect(current_user.class).to eq(User)
	end
	
end
