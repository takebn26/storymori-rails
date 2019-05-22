class StoriesController < ApplicationController
  def index
    stories = Story.joins(:pages).where(pages: {parent_id: nil}).select('stories.id, stories.title, pages.id as parentId')
    stories_hash = stories.map(&:attributes)

    render json: stories_hash, status: :ok
  end

  def create
    story = Story.new(title: story_params[:title], summary: story_params[:text][0..10])

    ActiveRecord::Base.transaction do
      story.save!
      story.pages.create(name: story_params[:title], text: story_params[:text])
    rescue ActiveRecord::RecordInvalid
      raise ResourceError.new('resource error')
    end

    render json: { storyId: story.id, pageId: story.pages.first.id }, status: :created
  end

  private

  def story_params
    params.permit(:title, :text)
  end
end
