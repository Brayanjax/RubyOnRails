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

ActiveRecord::Schema[7.2].define(version: 2024_09_10_000702) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "califications", force: :cascade do |t|
    t.float "points"
    t.text "advice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.integer "calification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landing_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.float "price"
    t.integer "status"
    t.boolean "calicated"
    t.bigint "rooms_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["rooms_id"], name: "index_reservations_on_rooms_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_kinds", force: :cascade do |t|
    t.string "name"
    t.integer "bed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "status"
    t.bigint "califications_id"
    t.bigint "hotels_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_kinds_id", null: false
    t.index ["califications_id"], name: "index_rooms_on_califications_id"
    t.index ["hotels_id"], name: "index_rooms_on_hotels_id"
    t.index ["room_kinds_id"], name: "index_rooms_on_room_kinds_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "roles_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["roles_id"], name: "index_users_on_roles_id"
  end

  add_foreign_key "reservations", "rooms", column: "rooms_id"
  add_foreign_key "reservations", "users", column: "users_id"
  add_foreign_key "rooms", "califications", column: "califications_id"
  add_foreign_key "rooms", "hotels", column: "hotels_id"
  add_foreign_key "rooms", "room_kinds", column: "room_kinds_id"
  add_foreign_key "users", "roles", column: "roles_id"
end
