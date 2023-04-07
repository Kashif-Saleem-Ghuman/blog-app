class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @users = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @users = User.find(params[:user_id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = current_user(params[:user_id])
    @post = Post.new
  end

  def create
    @user = current_user(params[:user_id])
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
