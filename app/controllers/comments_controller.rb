class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Comment not created!'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  def destroy 
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
