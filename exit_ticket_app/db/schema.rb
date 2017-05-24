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

ActiveRecord::Schema.define(version: 20170301161838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.integer  "number",     null: false
    t.string   "name",       null: false
    t.date     "date",       null: false
    t.time     "start_time", null: false
    t.time     "end_time",   null: false
    t.decimal  "avg_rating"
    t.integer  "user_id",    null: false
    t.integer  "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_lessons_on_program_id", using: :btree
    t.index ["user_id"], name: "index_lessons_on_user_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_memberships_on_program_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "location",                  null: false
    t.boolean  "is_active?", default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "respondent_name"
    t.integer  "lo_rating",             null: false
    t.integer  "delivery_rating",       null: false
    t.integer  "comfort_rating",        null: false
    t.string   "positive_comment"
    t.string   "negative_comment"
    t.string   "general_comment"
    t.boolean  "attended_office_hours", null: false
    t.integer  "lesson_id",             null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["lesson_id"], name: "index_surveys_on_lesson_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.boolean  "is_producer?",           default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
