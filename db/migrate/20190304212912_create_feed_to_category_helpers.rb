class CreateFeedToCategoryHelpers < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_to_category_helpers do |t|
      t.references :feed_category, foreign_key: true
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
