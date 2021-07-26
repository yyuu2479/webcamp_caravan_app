class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blogs_params)
    blog.save
    redirect_to blog_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blogs_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end


  # プライベート
  private
  def blogs_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
