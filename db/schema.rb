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

ActiveRecord::Schema.define(version: 20170506221902) do

  create_table "friends", force: :cascade do |t|
    t.boolean  "confirmed"
    t.integer  "user"
    t.integer  "friend"
    t.string   "friend_name"
    t.string   "friend_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sender"
    t.string   "recipient"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "wasread"
    t.integer  "recipid"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "traveller_id"
    t.integer  "agent_id"
    t.integer  "package_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "travel_packages", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "location"
    t.text     "description"
    t.string   "flight_num"
    t.string   "flight_depart"
    t.string   "flight_arrive"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "tags"
    t.string   "return_num"
    t.string   "return_depart"
    t.string   "return_arrive"
    t.string   "airport"
    t.string   "returnairport"
    t.boolean  "active"
    t.index ["user_id"], name: "index_travel_packages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "usertype",        default: 0
    t.boolean  "active"
    t.boolean  "private"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
