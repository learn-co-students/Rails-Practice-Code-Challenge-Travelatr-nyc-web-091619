class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @name = @blogger.name
        @age = @blogger.age
        @bio = @blogger.bio
        @likes = @blogger.count_likes
        @top_post = @blogger.top_post
        @top_post_title = @top_post? @top_post.title : "No posts yet!"
        @posts = @blogger.posts
        @top_destinations = @blogger.top_destinations
      
    end

    def new
        @blogger = Blogger.new
    end

    def create 
        @blogger = Blogger.new(blogger_params)

        if @blogger.save
            redirect_to blogger_path(@blogger)
        else 
            render :new
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(blogger_params)

        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            render :edit
        end
    end

    private 

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
    
end