# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_04_213042) do

  create_table "entries", force: :cascade do |t|
    t.integer "feed_id"
    t.string "title"
    t.string "url"
    t.string "author"
    t.datetime "published_datetime"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_entries_on_feed_id"
  end

  create_table "entry_tags", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_tags_on_entry_id"
    t.index ["tag_id"], name: "index_entry_tags_on_tag_id"
  end

  create_table "feed_categories", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feed_categories_on_user_id"
  end

  create_table "feed_subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "feed_id"
    t.index ["feed_id"], name: "index_feed_subscriptions_on_feed_id"
    t.index ["user_id"], name: "index_feed_subscriptions_on_user_id"
  end

  create_table "feed_to_category_helpers", force: :cascade do |t|
    t.integer "feed_category_id"
    t.integer "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_category_id"], name: "index_feed_to_category_helpers_on_feed_category_id"
    t.index ["feed_id"], name: "index_feed_to_category_helpers_on_feed_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "feed_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
