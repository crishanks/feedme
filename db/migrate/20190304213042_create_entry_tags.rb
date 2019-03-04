class CreateEntryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_tags do |t|
      t.references :entry, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
