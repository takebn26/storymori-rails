class PagesController < ApplicationController
  def show
    page = Page.find_by(id: params[:id], story_id: params[:story_id])

    return render json: { id: page.id, name: page.name, text: page.text, children: page.children }, status: :ok if page

    raise ActionController::RoutingError.new('routing error')
  end
end