class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end
  
  def create
    list = Blog.new(blogs_params)
    list.save
    redirect_to blogs_path
  end

  def edit
  end
  
  
  # プライベート
  private
  def blogs_params
    params.require(:blog).permit(:title, :category, :body)
  end
  
end
