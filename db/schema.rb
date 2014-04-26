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

ActiveRecord::Schema.define(version: 20140426095059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: true do |t|
    t.string  "token"
    t.integer "user_id"
  end

  add_index "devices", ["token"], name: "index_devices_on_token", unique: true, using: :btree
  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "token"
  end

  add_index "projects", ["token"], name: "index_projects_on_token", unique: true, using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "proxy_urls", force: true do |t|
    t.string "code"
    t.string "url"
  end

  add_index "proxy_urls", ["code"], name: "index_proxy_urls_on_code", unique: true, using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "subscriptions", ["project_id"], name: "index_subscriptions_on_project_id", using: :btree
  add_index "subscriptions", ["user_id", "project_id"], name: "index_subscriptions_on_user_id_and_project_id", unique: true, using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "github_id"
    t.string   "username"
    t.datetime "created_at"
    t.string   "token"
  end

  add_index "users", ["github_id"], name: "index_users_on_github_id", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

end
