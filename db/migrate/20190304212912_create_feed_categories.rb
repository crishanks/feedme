class CreateFeedCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_categories do |t|
      t.references :category, foreign_key: true
      t.references :feed, foreign_key: true
    end
  end
end
