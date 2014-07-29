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

ActiveRecord::Schema.define(version: 20140729191501) do

  create_table "communities", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["community_id"], name: "index_members_on_community_id"

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "yelp_url"
    t.string   "address"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["community_id"], name: "index_restaurants_on_community_id"

  create_table "reviews", force: true do |t|
    t.string   "text"
    t.float    "rating"
    t.integer  "restaurant_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["member_id"], name: "index_reviews_on_member_id"
  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id"

end
