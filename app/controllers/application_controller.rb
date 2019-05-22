class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  private

  def render_not_found
    render json: { message: "Sorry can't find that!" }, status: :not_found
  end

  def render_unprocessable_entity
    render json: { message: "can't create record" }, status: :unprocessable_entity
  end
end
