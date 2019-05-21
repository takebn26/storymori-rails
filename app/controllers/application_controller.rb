class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, with: :res_404

  def res_404
    render json: { message: "Sorry can't find that!" }, status: :not_found
  end
end
