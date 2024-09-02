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
    t.integer "User_id", null: false
    t.integer "Room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Room_id"], name: "index_reservations_on_Room_id"
    t.index ["User_id"], name: "index_reservations_on_User_id"
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
    t.integer "Calification_id", null: false
    t.integer "Kinds_id", null: false
    t.integer "Hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Calification_id"], name: "index_rooms_on_Calification_id"
    t.index ["Hotel_id"], name: "index_rooms_on_Hotel_id"
    t.index ["Kinds_id"], name: "index_rooms_on_Kinds_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.integer "Role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Role_id"], name: "index_users_on_Role_id"
  end

  add_foreign_key "reservations", "Rooms"
  add_foreign_key "reservations", "Users"
  add_foreign_key "rooms", "Califications"
  add_foreign_key "rooms", "Hotels"
  add_foreign_key "rooms", "Kinds", column: "Kinds_id"
  add_foreign_key "users", "Roles"
end
