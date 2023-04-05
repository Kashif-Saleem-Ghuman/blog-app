class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @users = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @users = User.find(params[:user_id])
    @comments = @post.comments
    @likes = @post.likes
  end
end
