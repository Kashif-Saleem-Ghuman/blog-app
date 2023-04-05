class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @users = User.find(params[:id]).order(created_at: :desc)
  end
end
