class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render: json: user, status: :cerated
        else
            render json: {errors: "Not successful"}, status: :unprocessable_entity
        end
    end

    def show
        if current_user
            render json: current_user, status: :ok
        else
            render json: {error: "Not authenticated"}, status: :unauthorized
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

    def current_user
        current_user ||= User.find_by(id: session[:user_id])
end
