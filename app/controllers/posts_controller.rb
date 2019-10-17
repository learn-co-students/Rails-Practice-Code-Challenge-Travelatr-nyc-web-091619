class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @title = @post.title
        @content = @post.content
        @author = @post.blogger
        @likes = @post.likes
        @destination = @post.destination
    
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0

        if @post.save
            redirect_to post_path(@post)
        else 
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])  
    end

    def update 
        @post = Post.find(params[:id]) 
        @post.update(post_params)

        if @post.valid?
            redirect_to post_path(@post)
        else
            render :edit
        end

    end

    def like
        @post = Post.find(params[:post_id])  
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
    
end