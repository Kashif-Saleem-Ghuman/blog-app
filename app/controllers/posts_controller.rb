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


  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path notice: "Post created successfully"
    else
      render :new
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :text)
  end

end