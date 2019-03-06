class User < ApplicationRecord

  #relationships
  has_many :feed_subscriptions
  has_many :feeds, through: :feed_subscriptions
  has_many :feed_categories
  has_many :tags
  has_many :entries, through: :feeds

  #authentication
  has_secure_password

  #validations
  
end
