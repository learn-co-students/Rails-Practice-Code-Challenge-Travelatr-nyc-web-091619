class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @featured_post = @destination.featured_post
    end

end