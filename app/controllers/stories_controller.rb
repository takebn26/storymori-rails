class StoriesController < ApplicationController
  def index
    stories = Story.joins(:pages).where(pages: {parent_id: nil}).select('stories.id, stories.title, pages.id as parentId')
    stories_hash = stories.map(&:attributes)

    render json: stories_hash, status: :ok
  end
end
