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
    @feed = Feed.find_or_create_by(feed_params)
    new_sub = FeedSubscription.create(user: @current_user, feed: @feed)
    redirect_to feed_path(@feed)
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :url, :description, :search)
  end

end
