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

ActiveRecord::Schema.define(version: 20180314100923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_points", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["user_id"], name: "index_data_points_on_user_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "identification_number"
    t.string "secret_key"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "token"
    t.text "refresh_token"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "description"
    t.string "target_key"
    t.string "target_value"
    t.integer "experience"
    t.integer "difficulty"
    t.integer "stars_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
    t.string "goal_type"
    t.boolean "state", default: false
    t.bigint "user_id"
    t.boolean "display", default: false
    t.boolean "predefined", default: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "tiers", force: :cascade do |t|
    t.string "loot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "sex"
    t.integer "height"
    t.integer "weight"
    t.integer "experience", default: 0
    t.integer "stars_quantity", default: 0
    t.boolean "premium", default: false
    t.string "photo"
    t.string "pseudo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "data_points", "users"
  add_foreign_key "devices", "users"
  add_foreign_key "goals", "users"
end
