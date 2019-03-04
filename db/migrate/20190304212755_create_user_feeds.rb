class CreateUserFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feeds do |t|
      t.references :user, foreign_key: true
      t.references :feed, foreign_key: true
    end
  end
end
