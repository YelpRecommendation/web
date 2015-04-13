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

ActiveRecord::Schema.define(version: 20150412160935) do

  create_table "attributions", id: false, force: true do |t|
    t.string "business_id", limit: 22, null: false
    t.string "attributons",            null: false
    t.string "value"
  end

# Could not dump table "business" because of following StandardError
#   Unknown type 'LONG' for column 'review_count'

  create_table "cate_id", id: false, force: true do |t|
    t.string "category"
  end

  create_table "categories", id: false, force: true do |t|
    t.string "business_id", limit: 22, null: false
    t.string "category",               null: false
  end

  create_table "count", primary_key: "key", force: true do |t|
    t.integer "value", limit: nil, precision: 38
  end

  create_table "hours", primary_key: "business_id", force: true do |t|
    t.string "sunday_open",     limit: 6
    t.string "sunday_close",    limit: 6
    t.string "monday_open",     limit: 6
    t.string "monday_close",    limit: 6
    t.string "tuesday_open",    limit: 6
    t.string "tuesday_close",   limit: 6
    t.string "wednesday_open",  limit: 6
    t.string "wednesday_close", limit: 6
    t.string "thursday_open",   limit: 6
    t.string "thursday_close",  limit: 6
    t.string "friday_open",     limit: 6
    t.string "friday_close",    limit: 6
    t.string "saturday_open",   limit: 6
    t.string "saturday_close",  limit: 6
  end

  create_table "id_cate", id: false, force: true do |t|
    t.decimal "id"
    t.string  "category"
  end

  create_table "neighborhoods", id: false, force: true do |t|
    t.string "business_id",   limit: 22, null: false
    t.string "neighborhoods",            null: false
  end

  create_table "new_user", id: false, force: true do |t|
    t.string "username",    limit: 20, null: false
    t.string "business_id", limit: 22
  end

# Could not dump table "review" because of following StandardError
#   Unknown type 'LONG' for column 'text'

  create_table "selectedcate", id: false, force: true do |t|
    t.integer "id",   limit: nil, precision: 38, null: false
    t.string  "name", limit: 30,                 null: false
  end

  create_table "simi_user", id: false, force: true do |t|
    t.string "user1", limit: 22
    t.string "user2", limit: 22
  end

  create_table "user_cate_count", id: false, force: true do |t|
    t.string  "user_id", limit: 22, null: false
    t.decimal "counter"
  end

  create_table "user_cate_id", id: false, force: true do |t|
    t.string  "user_id", limit: 22, null: false
    t.decimal "id"
  end

  create_table "user_favourite_business", id: false, force: true do |t|
    t.string  "user_id",     limit: 22
    t.string  "business_id", limit: 22
    t.integer "stars",       limit: nil, precision: 38
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yelp_tip", id: false, force: true do |t|
    t.string  "type",        limit: 10,                 null: false
    t.string  "text",        limit: 600,                null: false
    t.string  "business_id", limit: 22,                 null: false
    t.string  "user_id",     limit: 22,                 null: false
    t.string  "dates",       limit: 20,                 null: false
    t.integer "likes",       limit: nil, precision: 38
  end

  create_table "yelp_user", primary_key: "user_id", force: true do |t|
    t.string  "type",          limit: 10
    t.string  "name",          limit: 40
    t.integer "review_count",  limit: nil, precision: 38
    t.float   "average_stars"
  end

  add_foreign_key "review", "business", primary_key: "business_id", name: "sys_c003938"
  add_foreign_key "review", "yelp_user", column: "user_id", primary_key: "user_id", name: "sys_c003939"

  add_foreign_key "yelp_tip", "business", primary_key: "business_id", name: "foreignbusiness"
  add_foreign_key "yelp_tip", "yelp_user", column: "user_id", primary_key: "user_id", name: "sys_c003929"

end
