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

ActiveRecord::Schema.define(version: 20160728013255) do

  create_table "cases", force: :cascade do |t|
    t.string   "emergency_number"
    t.string   "emergency_name"
    t.string   "city"
    t.string   "district"
    t.text     "address"
    t.text     "comment"
    t.integer  "nanny_id"
    t.integer  "parent_id"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "charge_per_hour"
    t.index ["nanny_id"], name: "index_cases_on_nanny_id"
    t.index ["parent_id"], name: "index_cases_on_parent_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "case_id"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_comments_on_case_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "infos", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "weekday_charge"
    t.integer  "holiday_charge"
    t.integer  "special_charge"
    t.text     "def_special"
    t.text     "special"
    t.text     "introduction"
    t.integer  "min_hour"
    t.integer  "case_done"
    t.datetime "since"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "age_0_to_1_cases_done"
    t.integer  "age_1_to_5_cases_done"
    t.string   "lind_id"
    t.string   "qualification"
    t.string   "license_number"
    t.index ["nanny_id"], name: "index_infos_on_nanny_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "rating_id"
    t.string   "name"
    t.integer  "scored"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_items_on_rating_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "type"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "mobile_phone"
    t.string   "phone"
    t.datetime "birthdate"
    t.string   "city"
    t.string   "district"
    t.text     "address"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["mobile_phone"], name: "index_profiles_on_mobile_phone", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "rater_id"
    t.integer  "rated_id"
    t.text     "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_ratings_on_case_id"
    t.index ["rated_id"], name: "index_ratings_on_rated_id"
    t.index ["rater_id"], name: "index_ratings_on_rater_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "nanny_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "text"
    t.integer  "case_id"
    t.index ["nanny_id"], name: "index_schedules_on_nanny_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
