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

ActiveRecord::Schema[7.2].define(version: 2024_08_31_083806) do
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

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.integer "bed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landing_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.float "price"
    t.boolean "status"
    t.boolean "calicated"
    t.bigint "users_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "status"
    t.bigint "califications_id", null: false
    t.bigint "kinds_id", null: false
    t.bigint "hotels_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["califications_id"], name: "index_rooms_on_califications_id"
    t.index ["hotels_id"], name: "index_rooms_on_hotels_id"
    t.index ["kinds_id"], name: "index_rooms_on_kinds_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.bigint "roles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roles_id"], name: "index_users_on_roles_id"
  end

  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users", column: "users_id"
  add_foreign_key "rooms", "califications", column: "califications_id"
  add_foreign_key "rooms", "hotels", column: "hotels_id"
  add_foreign_key "rooms", "kinds", column: "kinds_id"
  add_foreign_key "users", "roles", column: "roles_id"
end
