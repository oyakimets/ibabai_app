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

ActiveRecord::Schema.define(version: 20140315133205) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "prodcat_id"
    t.boolean  "dropped"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
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
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "dropped"
    t.integer  "cat_count",  default: 0
  end

  create_table "catforms", force: true do |t|
    t.integer  "category_id", null: false
    t.integer  "formatt_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catforms", ["category_id", "formatt_id"], name: "index_catforms_on_category_id_and_formatt_id", unique: true
  add_index "catforms", ["category_id"], name: "index_catforms_on_category_id"
  add_index "catforms", ["formatt_id"], name: "index_catforms_on_formatt_id"

  create_table "chains", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "brand_id"
    t.integer  "prodcat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_1",      default: 0
    t.integer  "code_2",      default: 0
    t.integer  "code_3",      default: 0
  end

  add_index "charts", ["brand_id"], name: "index_charts_on_brand_id"
  add_index "charts", ["prodcat_id"], name: "index_charts_on_prodcat_id"
  add_index "charts", ["promoact_id"], name: "index_charts_on_promoact_id"

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

  create_table "cust_logs", force: true do |t|
    t.integer  "customer_id"
    t.integer  "promoact_id"
    t.integer  "store_id"
    t.boolean  "fc_1",        default: false
    t.boolean  "fc_2",        default: false
    t.boolean  "fc_3",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segment_id"
    t.integer  "category_id"
  end

  add_index "cust_logs", ["promoact_id"], name: "index_cust_logs_on_promoact_id"

  create_table "customers", force: true do |t|
    t.string   "gender"
    t.integer  "age"
    t.string   "income"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "phone"
    t.string   "device"
  end

  add_index "customers", ["authentication_token"], name: "index_customers_on_authentication_token", unique: true
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formatts", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "help_desks", force: true do |t|
    t.string   "message"
    t.boolean  "callback"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prodcats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promoacts", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "del_fee",       default: 0.25
    t.integer  "del_num"
    t.integer  "reward_1"
    t.integer  "reward_2"
    t.integer  "contact_limit"
    t.integer  "budget_limit"
    t.integer  "status",        default: 1
    t.integer  "client_id"
    t.string   "cont_tag"
    t.string   "cont_pres"
    t.string   "cont_desc"
    t.boolean  "dropped"
  end

  create_table "promobrands", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promobrands", ["brand_id"], name: "index_promobrands_on_brand_id"
  add_index "promobrands", ["promoact_id", "brand_id"], name: "index_promobrands_on_promoact_id_and_brand_id", unique: true
  add_index "promobrands", ["promoact_id"], name: "index_promobrands_on_promoact_id"

  create_table "promocats", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promocats", ["category_id"], name: "index_promocats_on_category_id"
  add_index "promocats", ["promoact_id", "category_id"], name: "index_promocats_on_promoact_id_and_category_id", unique: true
  add_index "promocats", ["promoact_id"], name: "index_promocats_on_promoact_id"

  create_table "promocities", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promocities", ["city_id"], name: "index_promocities_on_city_id"
  add_index "promocities", ["promoact_id", "city_id"], name: "index_promocities_on_promoact_id_and_city_id", unique: true
  add_index "promocities", ["promoact_id"], name: "index_promocities_on_promoact_id"

  create_table "promocustomers", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "segment_id"
  end

  add_index "promocustomers", ["customer_id"], name: "index_promocustomers_on_customer_id"
  add_index "promocustomers", ["promoact_id", "customer_id"], name: "index_promocustomers_on_promoact_id_and_customer_id", unique: true
  add_index "promocustomers", ["promoact_id"], name: "index_promocustomers_on_promoact_id"

  create_table "promofeedbacks", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "feedback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promofeedbacks", ["feedback_id"], name: "index_promofeedbacks_on_feedback_id"
  add_index "promofeedbacks", ["promoact_id", "feedback_id"], name: "index_promofeedbacks_on_promoact_id_and_feedback_id", unique: true
  add_index "promofeedbacks", ["promoact_id"], name: "index_promofeedbacks_on_promoact_id"

  create_table "promoprods", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "prodcat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promoprods", ["prodcat_id"], name: "index_promoprods_on_prodcat_id"
  add_index "promoprods", ["promoact_id", "prodcat_id"], name: "index_promoprods_on_promoact_id_and_prodcat_id", unique: true
  add_index "promoprods", ["promoact_id"], name: "index_promoprods_on_promoact_id"

  create_table "promorelations", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "past_promoact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promorelations", ["past_promoact_id"], name: "index_promorelations_on_past_promoact_id"
  add_index "promorelations", ["promoact_id", "past_promoact_id"], name: "index_promorelations_on_promoact_id_and_past_promoact_id", unique: true
  add_index "promorelations", ["promoact_id"], name: "index_promorelations_on_promoact_id"

  create_table "promosegments", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "segment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "promosegments", ["promoact_id", "segment_id"], name: "index_promosegments_on_promoact_id_and_segment_id", unique: true
  add_index "promosegments", ["promoact_id"], name: "index_promosegments_on_promoact_id"
  add_index "promosegments", ["segment_id"], name: "index_promosegments_on_segment_id"

  create_table "promostores", force: true do |t|
    t.integer  "promoact_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "category_id"
  end

  add_index "promostores", ["promoact_id", "store_id"], name: "index_promostores_on_promoact_id_and_store_id", unique: true
  add_index "promostores", ["promoact_id"], name: "index_promostores_on_promoact_id"
  add_index "promostores", ["store_id"], name: "index_promostores_on_store_id"

  create_table "segments", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "gender"
    t.integer  "age_min",    default: 15
    t.integer  "age_max",    default: 61
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "income"
    t.boolean  "dropped"
    t.integer  "cust_count", default: 0
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "formatt_id"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "lon"
    t.integer  "city_id"
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
