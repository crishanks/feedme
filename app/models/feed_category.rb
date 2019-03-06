class FeedCategory < ApplicationRecord
  belongs_to :user
  has_many :feeds, through: :feed_to_category_helper 
end
