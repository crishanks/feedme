class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]


  def index
    @feeds = @current_user.feeds
  end

  def show
  end

  def new
    @feed = Feed.search(params[:search])
  end

  def create
    @feed = Feed.find_or_create_by(feed_params)
    @new_feed = FeedSubscription.find_or_create_by(user: @current_user, feed: @feed)

    feed_entries = Entry.write_new_entries(Feed.fetch_and_parse_feed(@feed.feed_url))

    redirect_to feed_path(@feed)
  end

  def update
    @feed = Feed.find(params[:id])
    @new_feed = FeedSubscription.find_or_create_by(user: @current_user, feed: @feed)

    redirect_to feed_path(@feed)
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(
      :title,
      :url,
      :description,
      :search,
      :feed_url
    )
  end

end
