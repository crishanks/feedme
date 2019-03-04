class Feed < ApplicationRecord
  has_many :categories
  has_many :entries
end
