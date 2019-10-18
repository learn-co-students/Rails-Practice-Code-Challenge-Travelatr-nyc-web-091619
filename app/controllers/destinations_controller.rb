class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end
    
    def show
        @destination = Destination.find(params[:id])
        @sorted_l = @destination.posts.sort {|p| p.likes}
        @sorted_d = @destination.posts.sort {|p| p.created_at}
        @bloggers_age = @destination.bloggers.map {|b| b.age }.sum
        @bloggers_count = @destination.bloggers.count
    end

end
