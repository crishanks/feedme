class FeedToCategoryHelper < ApplicationRecord
    belongs_to :feed
    belongs_to :feed_category
end