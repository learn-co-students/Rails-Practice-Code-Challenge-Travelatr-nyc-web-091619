class BloggersController < ApplicationController

def index
    @bloggers = Blogger.all
end

def show
    @blogger = Blogger.find(params[:id])
end

def new
    @blogger = Blogger.new
end

def create
    @blogger = Blogger.new(blogger_params(:name, :bio, :age))
    @blogger.save
    redirect_to blogger_path(@blogger)
end

def edit
end

def update
end

def destroy
end

private

def blogger_params(*args)
    params.require(:blogger).permit(*args)
end

end
