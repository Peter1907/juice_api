class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: response_hash("success", "User created successfully"), status: :created
    else
      render json: response_hash("error", user.errors.full_messages), status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: response_hash("success", "User deleted successfully"), status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end