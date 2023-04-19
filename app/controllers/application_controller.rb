class ApplicationController < ActionController::API
  def response_hash(message, data)
    { message: message, data: data }
  end
end
