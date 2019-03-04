class Category < ApplicationRecord
  has_many :feed_categories
  has_many :feeds, through: :feed_categories 
end
