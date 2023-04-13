class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    return unless @comment.save

    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id]) # current_user
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
      redirect_to user_post_path(@post.author, @post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
