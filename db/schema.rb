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

ActiveRecord::Schema.define(version: 20141208192117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "statements", force: true do |t|
    t.integer  "user_id"
    t.integer  "follow",                 null: false
    t.integer  "duration",   default: 0
    t.integer  "status",     default: 0
    t.datetime "ending_at"
    t.string   "error"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statements_suggestions", force: true do |t|
    t.integer  "statement_id"
    t.integer  "suggestion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.integer  "tuid",              limit: 8, null: false
    t.string   "slug"
    t.string   "name"
    t.string   "screen_name"
    t.string   "profile_image_uri"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "uid",                    null: false
    t.integer  "role",       default: 0, null: false
    t.string   "token",                  null: false
    t.string   "secret",                 null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "location"
    t.string   "time_zone"
    t.string   "lang"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
