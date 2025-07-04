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

ActiveRecord::Schema.define(version: 2021_02_05_143705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "start_date"
    t.bigint "space_id"
    t.bigint "user_id"
    t.boolean "accepted"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "space_name", limit: 100
    t.text "description"
    t.decimal "price"
    t.bigint "user_id"
    t.string "start_date"
    t.string "end_date"
    t.string "image_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", limit: 50
    t.string "user_email"
    t.string "password_digest"
    t.string "pfp_url"
  end

  add_foreign_key "bookings", "spaces", on_delete: :cascade
  add_foreign_key "bookings", "users", on_delete: :cascade
  add_foreign_key "spaces", "users", on_delete: :cascade
end
