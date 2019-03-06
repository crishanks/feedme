class CreateFeedCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_categories do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
  end
end
