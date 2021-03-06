# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_054919) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "headhunter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "text"
    t.index ["headhunter_id"], name: "index_comments_on_headhunter_id"
    t.index ["user_profile_id"], name: "index_comments_on_user_profile_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "job_offers", force: :cascade do |t|
    t.date "start_date"
    t.decimal "salary"
    t.string "benefits"
    t.string "function"
    t.string "expectations"
    t.integer "status", default: 0
    t.integer "job_id", null: false
    t.integer "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "message"
    t.index ["job_id"], name: "index_job_offers_on_job_id"
    t.index ["user_profile_id"], name: "index_job_offers_on_user_profile_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "skills"
    t.string "salary"
    t.string "level"
    t.date "limit_date"
    t.string "local"
    t.integer "headhunter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["headhunter_id"], name: "index_jobs_on_headhunter_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "job_id", null: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_featured", default: 0
    t.integer "feature", default: 0
    t.string "feedback_message"
    t.index ["job_id"], name: "index_opportunities_on_job_id"
    t.index ["user_profile_id"], name: "index_opportunities_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name"
    t.string "social_name"
    t.date "date_of_birth"
    t.string "schooling"
    t.string "description"
    t.string "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "headhunters"
  add_foreign_key "comments", "user_profiles"
  add_foreign_key "job_offers", "jobs"
  add_foreign_key "job_offers", "user_profiles"
  add_foreign_key "jobs", "headhunters"
  add_foreign_key "opportunities", "jobs"
  add_foreign_key "opportunities", "user_profiles"
  add_foreign_key "user_profiles", "users"
end
