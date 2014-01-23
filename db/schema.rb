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

ActiveRecord::Schema.define(version: 20140123183201) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true

  create_table "actchains", force: true do |t|
    t.integer  "action_id"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actcities", force: true do |t|
    t.integer  "action_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actcustomers", force: true do |t|
    t.integer  "action_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actfeedbacks", force: true do |t|
    t.integer  "action_id"
    t.integer  "feedback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actformats", force: true do |t|
    t.integer  "action_id"
    t.integer  "format_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "del_fee",       default: 0.25
    t.integer  "del_num"
    t.integer  "reward_1"
    t.integer  "reward_2"
    t.integer  "contact_limit"
    t.integer  "budget_limit"
    t.integer  "status"
  end

  create_table "actsegments", force: true do |t|
    t.integer  "action_id"
    t.integer  "segment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actstores", force: true do |t|
    t.integer  "action_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "prodcat_id"
    t.boolean  "dropped"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true

  create_table "catchains", force: true do |t|
    t.integer  "category_id", null: false
    t.integer  "chain_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catchains", ["category_id", "chain_id"], name: "index_catchains_on_category_id_and_chain_id", unique: true
  add_index "catchains", ["category_id"], name: "index_catchains_on_category_id"
  add_index "catchains", ["chain_id"], name: "index_catchains_on_chain_id"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "dropped"
  end

  create_table "catforms", force: true do |t|
    t.integer  "category_id", null: false
    t.integer  "format_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catforms", ["category_id", "format_id"], name: "index_catforms_on_category_id_and_format_id", unique: true
  add_index "catforms", ["category_id"], name: "index_catforms_on_category_id"
  add_index "catforms", ["format_id"], name: "index_catforms_on_format_id"

  create_table "chains", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "contacts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["name"], name: "index_clients_on_name", unique: true

  create_table "customers", force: true do |t|
    t.string   "gender"
    t.integer  "age"
    t.string   "income"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prodcats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "gender"
    t.integer  "age_min"
    t.integer  "age_max"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "income"
    t.boolean  "dropped"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "format_id"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "tel1"
    t.string   "tel2"
    t.integer  "client_id"
    t.string   "remember_token"
    t.string   "pas_reset_token"
    t.datetime "pas_reset_sent_at"
    t.boolean  "admin"
    t.integer  "account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
