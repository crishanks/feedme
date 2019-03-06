class FeedCategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @feed_categories = FeedCategory.all
  end

  def show

  end

  private

  def set_category
    @feed_category = FeedCategory.find(params[:id])
  end
end
