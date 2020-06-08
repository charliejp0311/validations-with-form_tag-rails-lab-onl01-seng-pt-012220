class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.is_a?(Post)
      render :edit
    else
      @post = Post.new
      render :edit
    end
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

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end