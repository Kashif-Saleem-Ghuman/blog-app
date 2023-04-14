module Api
    module V1
      class UsersController < ApplicationController
        def index
          @all_users = User.all
          @user = current_user

          render json: @all_users
        end

        def show
          @user = User.find(request.parameters[:id])
          render json: @user
        end
      end
    end
  end

