class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def Show
    @users = User.find(params[:id])
  end
end
