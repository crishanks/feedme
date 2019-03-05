class Feed < ApplicationRecord
  has_many :feed_categories
  has_many :categories, through: :feed_categories
  has_many :entries
end
