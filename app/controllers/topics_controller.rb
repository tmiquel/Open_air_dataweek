class TopicsController < ApplicationController

    def index
        @topics = Topic.with_attached_main_picture.all
    end

    def show
        @topic = Topic.with_attached_main_picture.find(params[:id])
        @related_topics = []
        3.times do
            @related_topics << Topic.all.sample
        end
    end

    def create
        
    end

    def update
        
    end

end
