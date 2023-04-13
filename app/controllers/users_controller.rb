class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @users = User.all.includes(:posts)
  end

  def show
    @users = User.includes(posts: %i[likes comments]).find(params[:id])
  end
end
