class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :feed
      t.string :title
      t.string :author
      t.text :summary
      t.text :content
      t.string :url
      t.datetime :published_datetime

      t.timestamps
    end
  end
end
