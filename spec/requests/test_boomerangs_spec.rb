require 'rails_helper'

RSpec.describe "TestBoomerangs", type: :request do
  describe "GET /test_boomerangs" do
    it "works! (now write some real specs)" do
      get test_boomerangs_path
      expect(response).to have_http_status(200)
    end
  end
end
