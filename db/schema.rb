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

ActiveRecord::Schema[7.0].define(version: 2024_10_02_062719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "frequency"
    t.date "begin_date"
    t.bigint "colocation_id", null: false
    t.bigint "flatmate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colocation_id"], name: "index_chores_on_colocation_id"
    t.index ["flatmate_id"], name: "index_chores_on_flatmate_id"
  end

  create_table "colocations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "begin_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flatmates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "description"
    t.bigint "colocation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["colocation_id"], name: "index_flatmates_on_colocation_id"
    t.index ["email"], name: "index_flatmates_on_email"
    t.index ["reset_password_token"], name: "index_flatmates_on_reset_password_token", unique: true
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "flatmate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["flatmate_id"], name: "index_invitations_on_flatmate_id"
  end

  create_table "shoppings", force: :cascade do |t|
    t.string "item"
    t.boolean "bought"
    t.integer "quantity"
    t.bigint "colocation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colocation_id"], name: "index_shoppings_on_colocation_id"
  end

  create_table "spending_to_flatmates", force: :cascade do |t|
    t.bigint "flatmate_id", null: false
    t.bigint "spending_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flatmate_id"], name: "index_spending_to_flatmates_on_flatmate_id"
    t.index ["spending_id"], name: "index_spending_to_flatmates_on_spending_id"
  end

  create_table "spendings", force: :cascade do |t|
    t.string "title"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chores", "colocations"
  add_foreign_key "chores", "flatmates"
  add_foreign_key "flatmates", "colocations"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "flatmates"
  add_foreign_key "shoppings", "colocations"
  add_foreign_key "spending_to_flatmates", "flatmates"
  add_foreign_key "spending_to_flatmates", "spendings"
end
