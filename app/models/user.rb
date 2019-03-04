class User < ApplicationRecord
  has_many :feed_subscriptions
  has_many :feeds, through: :feed_subscriptions
end
