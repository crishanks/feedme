class EntriesController < ApplicationController
  before_action :set_entry, only: [:show]

  def index
    @entries = @current_user.entries.order(published_datetime: :desc)
  end

  def show
  end

  def refresh
    # @current_user.feeds.each { |feed| feed.refresh_feed }
    #
    # redirect_to entries_path
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
