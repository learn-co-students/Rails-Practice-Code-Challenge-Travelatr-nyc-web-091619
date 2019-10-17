class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @full_location = @destination.full_location
        @recents = @destination.recent_posts
        @top_post = @destination.top_post
        @top_post_title = @top_post.title
        @age = @destination.avg_age
    
    end

    
end