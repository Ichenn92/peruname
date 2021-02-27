# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2021_02_27_104101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "character_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_category_id"], name: "index_characters_on_character_category_id"
    t.index ["name"], name: "index_characters_on_name"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "performance_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer "price_per_hour"
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "character_id", null: false
    t.bigint "performance_category_id", null: false
    t.index ["character_id"], name: "index_performances_on_character_id"
    t.index ["location_id"], name: "index_performances_on_location_id"
    t.index ["performance_category_id"], name: "index_performances_on_performance_category_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "actor", default: false, null: false
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.time "availibility_start_time"
    t.time "availibility_end_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "character_categories"
  add_foreign_key "performances", "characters"
  add_foreign_key "performances", "locations"
  add_foreign_key "performances", "performance_categories"
  add_foreign_key "performances", "users"
end
