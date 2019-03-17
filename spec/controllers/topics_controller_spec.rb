require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Topic. As you add validations to Topic, be sure to
  # adjust the attributes here as well.
  before(:each) do 
    @topic = FactoryBot.create(:topic, :with_main_picture) 
  end

  describe 'GET #index' do
    it "assigns @topics" do
      get :index
      expect(assigns(:topics)).to eq([@topic])
    end

    it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  	end
  end

	describe "GET show" do
	  it "assigns @users" do
	    get :show, params: {id: @topic.id}
	    expect(assigns(:topic)).to eq(@topic)
	  end

	  it "renders the show template" do
	    get :show, params: {id: @topic.id}
	    expect(response).to render_template("show")
	  end
	end

end
