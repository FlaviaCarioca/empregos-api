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

ActiveRecord::Schema.define(version: 20150717225512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 70, null: false
    t.string "address", limit: 100
    t.string "city", limit: 50
    t.string "state", limit: 2
    t.string "zip", limit: 5
    t.string "title", limit: 100
    t.text "description"
    t.string "minimum_salary", limit: 7
    t.string "linkedin", limit: 50
    t.string "github", limit: 50
    t.boolean "is_active", default: true
    t.boolean "can_relocate", default: true
    t.boolean "can_remote", default: true
    t.boolean "is_visa_needed", default: true
    t.bigint "specialization_id"
    t.bigint "company_size_id"
    t.bigint "job_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_size_id"], name: "index_candidates_on_company_size_id"
    t.index ["job_type_id"], name: "index_candidates_on_job_type_id"
    t.index ["specialization_id"], name: "index_candidates_on_specialization_id"
  end

  create_table "company_sizes", force: :cascade do |t|
    t.string "size", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types", force: :cascade do |t|
    t.string "name", limit: 11, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "company_name", limit: 150, null: false
    t.string "title", limit: 50, null: false
    t.string "date_from", limit: 7, null: false
    t.string "date_to", limit: 7
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_positions_on_candidate_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "degree", limit: 150
    t.string "date_from", limit: 7, null: false
    t.string "date_to", limit: 7
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_schools_on_candidate_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.boolean "is_required", default: false, null: false
    t.integer "skillable_id", null: false
    t.string "skillable_type", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skillable_id", "skillable_type"], name: "index_skills_on_skillable_id_and_skillable_type", unique: true
    t.index ["skillable_id"], name: "index_skills_on_skillable_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name", limit: 25, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "password", limit: 50, null: false
    t.integer "profile_id", null: false
    t.string "profile_type", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
  end

  add_foreign_key "candidates", "company_sizes"
  add_foreign_key "candidates", "job_types"
  add_foreign_key "candidates", "specializations"
  add_foreign_key "positions", "candidates", on_delete: :cascade
  add_foreign_key "schools", "candidates", on_delete: :cascade
end
