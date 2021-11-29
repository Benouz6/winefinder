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

ActiveRecord::Schema.define(version: 2021_11_26_193546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_pairings", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_food_pairings_on_food_id"
    t.index ["wine_id"], name: "index_food_pairings_on_wine_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "bottle_count"
    t.bigint "store_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_inventories_on_store_id"
    t.index ["wine_id"], name: "index_inventories_on_wine_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "adress"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "description"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "saq_id"
    t.string "origin"
    t.string "image_url"
    t.integer "rating", default: 0, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "CAD", null: false
  end

  add_foreign_key "food_pairings", "foods"
  add_foreign_key "food_pairings", "wines"
  add_foreign_key "inventories", "stores"
  add_foreign_key "inventories", "wines"
end
