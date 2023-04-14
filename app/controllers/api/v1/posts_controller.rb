class Api::V1::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    post = user.post
    render json: post
  end
end
