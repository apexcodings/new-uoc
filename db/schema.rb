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

ActiveRecord::Schema.define(version: 20151231202007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "requestor_first_name"
    t.string   "requestor_mi"
    t.string   "requestor_last_name"
    t.string   "requestor_phone_prefix"
    t.string   "requestor_phone"
    t.string   "requestor_email"
    t.string   "requestor_time_to_reach"
    t.string   "patient_first_name"
    t.string   "patient_mi"
    t.string   "patient_last_name"
    t.string   "patient_phone_prefix"
    t.string   "patient_phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "us_state"
    t.string   "zip"
    t.string   "dob"
    t.string   "gender"
    t.string   "injury_location"
    t.string   "injury_location_other"
    t.string   "injury_date"
    t.boolean  "prior_treatment"
    t.boolean  "x_ray"
    t.boolean  "no_insurance"
    t.string   "insurance_plan_name"
    t.string   "insurance_policy_number"
    t.string   "preferred_location"
    t.boolean  "preferred_day_mo"
    t.boolean  "preferred_day_tu"
    t.boolean  "preferred_day_we"
    t.boolean  "preferred_day_th"
    t.boolean  "preferred_day_fr"
    t.boolean  "preferred_time_am"
    t.boolean  "preferred_time_pm"
    t.string   "appointment_type"
    t.text     "questions"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string   "phone"
    t.string   "location"
    t.string   "specialty"
    t.string   "procedures"
    t.string   "education"
    t.string   "category"
    t.text     "body"
    t.string   "image_url",  default: "expert_default.png"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.integer  "position"
  end

  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
