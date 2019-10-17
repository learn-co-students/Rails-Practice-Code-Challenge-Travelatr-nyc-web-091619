class PostsController < ApplicationController
    def new 
       @post = Post.new
    end 

    def create 
        @post = Post.new(posts_params)
            if @post.save 
                puts "Created!"
                redirect_to post_path(@post)
            else 
                render "new"
            end 
    end 

    def show
        @post = Post.find(params[:id]) 
        @blogger = @post.blogger
        @destination = @post.destination
    end 

    def edit
        @post = Post.find(params[:id]) 
        
         
    end 

    def update 
        @post = Post.find(params[:id]) 
        @post.update(posts_params)
            if @post.save

                redirect_to post_path(@post)
            else 
                render "edit"
            end 
    end 

    def increase_like 
        @post = Post.find(params[:id])
        @post.likes += 1 
        @post.save
        redirect_to post_path(@post)

    end 




    private 
    def posts_params 
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 



end 
