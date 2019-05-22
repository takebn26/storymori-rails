class ApplicationController < ActionController::API
  class ResourceError < StandardError; end

  rescue_from ActionController::RoutingError, with: :res_404
  rescue_from ActiveRecord::RecordNotFound, with: :res_404
  rescue_from ActiveRecord::RecordInvalid, with: :res_422
  rescue_from ResourceError, with: :res_500

  def res_404
    render json: { message: "Sorry can't find that!" }, status: :not_found
  end

  def res_422
    render json: { message: "can't create record" }, status: :unprocessable_entity
  end

  def res_500
    render json: { message: "Something broke" }, status: :internal_server_error
  end
end
