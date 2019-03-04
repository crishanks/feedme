class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.string :author
      t.datetime :published_datetime
      t.text :summary

      t.timestamps
    end
  end
end
