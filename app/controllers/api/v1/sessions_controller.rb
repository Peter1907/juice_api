class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request
  
  def login
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      token = JWT.encode({ id: user.id }, 'secret_juice')
      data = { token: token, user_name: user.name }
      render json: response_hash("success", data), status: :ok
    else
      render json: response_hash("error", "Invalid email or password"), status: :unauthorized
    end
  end
end
