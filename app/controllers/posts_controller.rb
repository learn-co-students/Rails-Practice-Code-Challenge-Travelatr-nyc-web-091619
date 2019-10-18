class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
        @content = @post.content
        @author = @post.blogger
        @likes = @post.likes
        @destination = @post.destination
    end

    def show
        @post = Post.find(params[:id])
        @author = @post.blogger
    end

    def create
        @post = Post.create(post_params)
        @post.likes = 0

        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path 
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to new_post_path
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