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

ActiveRecord::Schema.define(version: 20150721184255) do

  create_table "classtimes", force: :cascade do |t|
    t.integer  "onetime_id"
    t.integer  "user_id"
    t.datetime "thedatetime"
    t.integer  "priority",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "start_time"
    t.boolean  "urgent",       default: false
    t.string   "hangout_link"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "note"
  end

  create_table "onedays", force: :cascade do |t|
    t.integer  "oneweek_id"
    t.string   "thedate"
    t.datetime "thedatetime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "onetimes", force: :cascade do |t|
    t.integer  "oneday_id"
    t.integer  "clock"
    t.integer  "minute",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "oneweeks", force: :cascade do |t|
    t.string   "monday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "post_code"
    t.text     "address"
    t.boolean  "checkout",   default: false
    t.integer  "plan"
    t.integer  "amount"
    t.integer  "method"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "recommender_id"
    t.integer  "role",                   default: 0
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
