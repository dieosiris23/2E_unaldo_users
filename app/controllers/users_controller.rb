class UsersController < ApplicationController
    soap_service namespace: 'urn:WashOutUser'
    before_action :set_user, only: [:show, :update, :destroy]
   
    def index
      @users = User.all
      render json: @users
    end
   
    # GET /users/1
    def show_by_email
        @user = User.find_by_email(params[:email])
        render json: @user
    end
   
    def create
      @user = User.new(user_params)
   
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
   
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
   
    def destroy
      @user.destroy
      head :no_content
    end
   
    private
      def set_user
        @user = User.find(params[:id])
      end
   
      def user_params
        params.require(:user).permit(:email, :password, :username)
      end
  end