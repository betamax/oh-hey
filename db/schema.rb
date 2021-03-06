# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150125112657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event"
    t.string   "location"
    t.text     "description"
    t.date     "date"
    t.string   "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "str_id"
  end

  create_table "tweet_documents", force: :cascade do |t|
    t.text     "url"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "twitter_id"
    t.text     "url"
    t.datetime "tweeted_at"
    t.text     "text"
    t.integer  "twitter_user_id"
    t.integer  "tweet_document_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "tweets", ["tweet_document_id"], name: "index_tweets_on_tweet_document_id", using: :btree
  add_index "tweets", ["twitter_user_id"], name: "index_tweets_on_twitter_user_id", using: :btree

  create_table "twitter_users", force: :cascade do |t|
    t.text     "twitter_username"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "status",           default: "pending"
    t.json     "following"
    t.json     "results_cache"
  end

  create_table "users", force: :cascade do |t|
    t.string   "twitter"
    t.string   "github"
    t.string   "remote_id"
    t.string   "uuid"
    t.string   "major"
    t.string   "minor"
    t.string   "distance"
    t.json     "github_json"
    t.json     "twitter_json"
    t.json     "github_favs"
    t.datetime "last_near"
  end

end
