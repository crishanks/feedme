class CreateFeedSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
