class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments, :likes).where(author: @users)
  end

  def show
    @users = User.find(params[:user_id])
    @post = Post.includes(:author, :comments).find(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(author: @user, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      @post.update_posts_counter
      flash[:notice] = 'Your post was created successfully'
      redirect_to user_post_path(@user, @post)
    else
      render :new
      flash.alert = 'sorry, something went wrong!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
