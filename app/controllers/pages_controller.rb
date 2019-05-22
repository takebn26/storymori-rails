class PagesController < ApplicationController
  def show
    page = Page.find_by!(id: params[:id], story_id: params[:story_id])

    render json: { id: page.id, name: page.name, text: page.text, children: page.children }, status: :ok
  end

  def create
    page = Page.find_by!(id: params[:parent_id], story_id: params[:story_id])
    child_page = page.children.new(page_params)

    child_page.save!

    render json: { id: child_page.id }, status: :created
  end

  private

  def page_params
    params.require(:page).permit(:name, :text).merge(story_id: params[:story_id])
  end
end