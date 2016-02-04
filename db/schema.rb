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

ActiveRecord::Schema.define(version: 20160204141902) do

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
    t.boolean  "portal_token"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

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
    t.string   "image_url",          default: "expert_default.png"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "news_releases", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "ancestry"
    t.integer  "position"
    t.string   "label"
    t.string   "image_url"
    t.string   "redirect_url"
    t.string   "seo_title"
    t.string   "seo_keywords"
    t.text     "seo_description"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.boolean  "publish",                 default: true
  end

  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.string   "practice"
    t.string   "physician"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.string   "patient_name"
    t.string   "dob"
    t.string   "patient_phone"
    t.string   "patient_phone_alt"
    t.string   "patient_email"
    t.string   "employer"
    t.string   "insurance"
    t.text     "diagnosis"
    t.boolean  "prior_surgery"
    t.boolean  "workers_comp"
    t.boolean  "bone_scan"
    t.string   "bone_scan_where"
    t.boolean  "ct_scan"
    t.string   "ct_scan_where"
    t.boolean  "mri"
    t.string   "mri_where"
    t.boolean  "emg"
    t.string   "emg_where"
    t.boolean  "x_rays"
    t.string   "x_rays_where"
    t.boolean  "cast"
    t.string   "cast_where"
    t.string   "preferred_physician"
    t.string   "preferred_office"
    t.string   "time_to_be_seen"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
