class UsersController < ApplicationController
    def index
        limit = params[:size] || 10
        offset = params[:page] ? (limit * page) : (limit * 0)
        @users = User.limit(limit).offset(offset)
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def create
        @user = User.create(create_user_params)
        render json: @user, status: :created
    end

    def update
        Account.find(params[:id]).update(update_user_params)
        render status: :ok
    end

    private

    def create_user_params
        params.require(:user).require(:email)
        params.require(:user).require(:password)
        params.require(:user).require(:first_name)
        params.require(:user).require(:last_name)
        params.require(:user).require(:account_id)
        params
    end

    def update_user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :account_id)
    end
end