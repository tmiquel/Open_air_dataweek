require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #ma_collection" do
    it "returns http success" do
      get :ma_collection
      expect(response).to have_http_status(:success)
    end
  end

end
