class ApplicationController < ActionController::API
  before_action :authenticate_request

  def response_hash(message, data)
    { message: message, data: data }
  end

  private

  def decode
    token = request.headers["Authorization"].split(" ").last
    payload = JWT.decode(token, 'secret_juice')[0]
    @current_user = User.find(payload['id'])
  rescue
    'Invalid token'
  end

  def authenticate_request
    if decode == 'Invalid token'
      render json: response_hash("error", "Invalid token"), status: :unauthorized
    end
  end
end
