class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts)
  end

  def show
    @users = User.includes(posts: %i[likes comments]).find(params[:id])
  end
end
