class Api::V1::Users::UsersController < ApplicationController
  module Api
    module V1
      class UsersController < ApplicationController
        def index
          @all_users = User.all
          @user = current_user
        end

        def show
          @user = User.find(request.parameters[:id])
        end
      end
    end
  end
end
