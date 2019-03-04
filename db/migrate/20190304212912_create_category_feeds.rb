class CreateCategoryFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :category_feeds do |t|
      t.references :category, foreign_key: true
      t.references :feed, foreign_key: true
    end
  end
end
