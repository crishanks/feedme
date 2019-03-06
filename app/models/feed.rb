class Feed < ApplicationRecord
  has_many :feed_subscriptions
  has_many :users, through: :feed_subscriptions
  has_many :feed_to_category_helpers
  has_many :feed_categories, through: :feed_to_category_helpers
  has_many :entries
  has_many :tags, through: :entries

  def self.search(search_term)

    @feed = add_scheme_to_search_url(search_term)

    if @feed.nil?
      feed = find_feed_from_url(search_term)

      if !feed.nil?
        feed = fetch_and_parse_feed(feed)

        @feed = Feed.new(
          url: feed.url,
          description: feed.description,
          title: feed.title,
          categories: Category.all.sample(1)
          )
        end
    else
      @feed
    end
  end

  def self.add_scheme_to_search_url(search_term)
    if search_term
      http = Feed.find_by(url: "http://#{search_term}")
      https = Feed.find_by(url: "https://#{search_term}")

      if http
        @feed = http
      elsif https
        @feed = https
      end
    end
  end

  def self.find_feed_from_url(url)
    Feedbag.find(url).first if url
  end

  def self.fetch_and_parse_feed(feed)
    Feedjira::Feed.fetch_and_parse(feed)
  end
end
