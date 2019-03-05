class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]

  def index
    @feeds = Feed.all
  end

  def show

  end

  def new
    @feed = Feed.search(params[:search])
  end

  def create
    # @feed.save
    redirect_to feed_path(@feed)
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
