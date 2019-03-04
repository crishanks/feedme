class Entry < ApplicationRecord
  belongs_to :feed
  has_many :entry_tags
  has_many :tags, through: :entry_tags
end
