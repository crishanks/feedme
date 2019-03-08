class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :settings, :update_settings]

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

  def settings
  end

  def update_settings
    # binding.pry
    @current_user.update_or_create_tags(entry_params)
    redirect_to feed_entry_path(@entry)
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:id, tag_ids: [], tags: [:name] )
  end
end
