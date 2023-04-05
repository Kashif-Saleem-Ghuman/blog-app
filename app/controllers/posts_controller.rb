class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id:params[:user_id]).order(created_at: :desc)
    @users = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id]).order(created_at: :desc)
    @users = User.find(params[:id]).order(created_at: :desc)
    @comments = @post.comments.order(created_at: :desc)
    @likes = @post.likes
  end
end
