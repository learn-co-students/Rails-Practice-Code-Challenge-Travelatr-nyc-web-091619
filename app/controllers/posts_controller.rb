class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to post_path(@post)
        else
            flash[:post_errors] =  @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:post_errors] =  @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.was_liked
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end