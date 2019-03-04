class Tag < ApplicationRecord
  has_many :article_tags
  has_many :entries, through: :article_tags
end
