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

ActiveRecord::Schema.define(version: 20130928174444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brews", force: true do |t|
    t.text     "description"
    t.string   "recipe_url"
    t.integer  "calendar_id"
    t.float    "og"
    t.float    "fg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "status"
    t.date     "planned_date"
    t.date     "brewed_on"
    t.date     "tapped_on"
  end

  add_index "brews", ["calendar_id"], name: "index_brews_on_calendar_id", using: :btree
  add_index "brews", ["status"], name: "index_brews_on_status", using: :btree

  create_table "calendars", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "hidden",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
