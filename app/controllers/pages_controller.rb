class PagesController < ApplicationController
  def show
    page = Page.find_by(id: params[:id], story_id: params[:story_id])

    return render json: { id: page.id, name: page.name, text: page.text, children: page.children }, status: :ok if page

    raise ActionController::RoutingError.new('routing error')
  end

  def create
    page = Page.find_by(id: params[:parent_id], story_id: params[:story_id])
    raise ResourceError unless page

    child_page = page.children.new(page_params)

    return render json: { id: child_page.id }, status: :created  if child_page.save

    raise ResourceError.new('resource error')
  end

  private

  def page_params
    params.require(:page).permit(:name, :text).merge(story_id: params[:story_id])
  end
end