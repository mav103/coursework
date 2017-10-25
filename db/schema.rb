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

ActiveRecord::Schema.define(version: 20171025192223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "second_name", limit: 30,  null: false
    t.string   "first_name",  limit: 30,  null: false
    t.string   "last_name",   limit: 30,  null: false
    t.string   "passport",    limit: 30,  null: false
    t.integer  "insurance",               null: false
    t.string   "residence",               null: false
    t.date     "created",                 null: false
    t.string   "allergy",     limit: 128, null: false
    t.integer  "cart_number",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "cards", ["cart_number"], name: "index_cards_on_cart_number", unique: true, using: :btree
  add_index "cards", ["insurance"], name: "index_cards_on_insurance", unique: true, using: :btree
  add_index "cards", ["passport"], name: "index_cards_on_passport", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
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

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "results", force: :cascade do |t|
    t.string   "conclusion",       limit: 128, null: false
    t.string   "title",            limit: 128, null: false
    t.date     "rdate",                        null: false
    t.string   "appointment",      limit: 128, null: false
    t.string   "causes",           limit: 128, null: false
    t.string   "first_inspection", limit: 128, null: false
    t.string   "results",          limit: 128, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["info"], name: "index_roles_on_info", unique: true, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "result_id",  null: false
    t.integer  "card_id",    null: false
    t.integer  "ward_id",    null: false
    t.string   "cause",      null: false
    t.date     "entered",    null: false
    t.date     "ended",      null: false
    t.string   "epicrisis",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "surveys", ["card_id"], name: "index_surveys_on_card_id", using: :btree
  add_index "surveys", ["result_id"], name: "index_surveys_on_result_id", using: :btree
  add_index "surveys", ["ward_id"], name: "index_surveys_on_ward_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "wards", force: :cascade do |t|
    t.string   "department",                  null: false
    t.integer  "floor",                       null: false
    t.integer  "capacity",                    null: false
    t.integer  "number",                      null: false
    t.integer  "num_of_pacients", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "wards", ["number"], name: "index_wards_on_number", unique: true, using: :btree

  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "surveys", "cards"
  add_foreign_key "surveys", "results"
  add_foreign_key "surveys", "wards"
end
