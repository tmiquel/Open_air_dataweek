class TopicsController < ApplicationController

    def show
        @topics = Topic.find(params[:id])
    end

    def create
        
    end

    def update
        
    end

    def index
        @topics = Topic.all
    end

end
