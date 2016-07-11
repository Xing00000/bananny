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

ActiveRecord::Schema.define(version: 20160711170440) do

  create_table "profiles", force: :cascade do |t|
    t.string   "type"
    t.string   "last_name"
    t.string   "frist_name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "mobile_phone"
    t.string   "phone"
    t.datetime "birthdate"
    t.string   "city"
    t.string   "district"
    t.text     "address"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["mobile_phone"], name: "index_profiles_on_mobile_phone", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "nanny_id"
    t.date     "date"
    t.integer  "helfhour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
