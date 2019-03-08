class FeedToCategoryHelper < ApplicationRecord
    belongs_to :feed
    belongs_to :feed_category

    validates :feed_category_id, uniqueness: { scope: :feed_id }, presence: true
end