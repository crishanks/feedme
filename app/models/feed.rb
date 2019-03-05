class Feed < ApplicationRecord
  has_many :feed_categories
  has_many :categories, through: :feed_categories
  has_many :entries
  
  def self.search(search_term)
    if Feed.find_by(search_term) == search_term
      @feed = Feed.find_by(search_term)
    else
      feed = Feedbag.find(search_term).first
      feed = Feedjira::Feed.fetch_and_parse(feed) if !feed.empty?
      @feed = Feed.new(
        url: feed.url,
        description: feed.description,
        title: feed.title,
        categories: Category.all.sample(1)
      )
    end
  end
end
