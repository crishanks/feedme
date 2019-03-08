class User < ApplicationRecord

  #relationships
  has_many :feed_subscriptions
  has_many :feeds, through: :feed_subscriptions
  has_many :feed_categories
  has_many :tags
  has_many :entries, through: :feeds

  validates :username, {presence: true, uniqueness: true}
  validates :name, presence: true
  #authentication
  has_secure_password

  def update_or_create_feed_cats(params_hash)
    feed = Feed.find(params_hash[:id])

    if params_hash[:feed_category_ids]
      params_hash[:feed_category_ids].each do |feed_cat_id|
        FeedToCategoryHelper.create(feed: feed, feed_category_id: feed_cat_id)
      end
    end

    if !params_hash[:feed_categories][:title].empty?
      feed_cat = FeedCategory.find_or_create_by(user: self, title: params_hash[:feed_categories][:title])
      FeedToCategoryHelper.create(feed: feed, feed_category: feed_cat)
    end
  end

end
