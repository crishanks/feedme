class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]

  def index
    @feeds = Feed.all
  end

  def show

  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
