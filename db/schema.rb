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

ActiveRecord::Schema.define(version: 20180926051454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "supplier_id"
    t.integer  "buyer_id"
    t.boolean  "fulfilled"
    t.datetime "deleted_at"
    t.datetime "date_issued"
    t.index ["buyer_id"], name: "index_bids_on_buyer_id", using: :btree
    t.index ["supplier_id"], name: "index_bids_on_supplier_id", using: :btree
  end

  create_table "buyer_reviews", force: :cascade do |t|
    t.integer  "rating",      null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "buyer_id"
    t.integer  "supplier_id"
    t.index ["buyer_id"], name: "index_buyer_reviews_on_buyer_id", using: :btree
    t.index ["supplier_id"], name: "index_buyer_reviews_on_supplier_id", using: :btree
  end

  create_table "buyers", force: :cascade do |t|
    t.string   "email",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "valid_token"
    t.decimal  "rating"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
    t.integer  "buyer_id"
    t.integer  "supplier_id"
    t.index ["buyer_id"], name: "index_notifications_on_buyer_id", using: :btree
    t.index ["order_id"], name: "index_notifications_on_order_id", using: :btree
    t.index ["supplier_id"], name: "index_notifications_on_supplier_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "buyer_id"
    t.integer  "supplier_id"
    t.boolean  "fulfilled"
    t.datetime "deleted_at"
    t.datetime "date_issued"
    t.index ["buyer_id"], name: "index_offers_on_buyer_id", using: :btree
    t.index ["supplier_id"], name: "index_offers_on_supplier_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "buyer_fulfilled"
    t.boolean  "supplier_fulfilled"
    t.boolean  "fulfilled"
    t.integer  "supplier_id"
    t.integer  "buyer_id"
    t.integer  "bid_id"
    t.integer  "offer_id"
    t.datetime "deleted_at"
    t.text     "buyer_notes"
    t.text     "supplier_notes"
    t.index ["bid_id"], name: "index_orders_on_bid_id", using: :btree
    t.index ["buyer_id"], name: "index_orders_on_buyer_id", using: :btree
    t.index ["offer_id"], name: "index_orders_on_offer_id", using: :btree
    t.index ["supplier_id"], name: "index_orders_on_supplier_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "amount",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "bid_id"
    t.integer  "offer_id"
    t.integer  "price"
    t.text     "description"
    t.datetime "date_issued"
    t.index ["bid_id"], name: "index_products_on_bid_id", using: :btree
    t.index ["offer_id"], name: "index_products_on_offer_id", using: :btree
  end

  create_table "supplier_reviews", force: :cascade do |t|
    t.integer  "rating",      null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "buyer_id"
    t.integer  "supplier_id"
    t.index ["buyer_id"], name: "index_supplier_reviews_on_buyer_id", using: :btree
    t.index ["supplier_id"], name: "index_supplier_reviews_on_supplier_id", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "email",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "valid_token"
    t.decimal  "rating"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bids", "suppliers"
  add_foreign_key "buyer_reviews", "buyers"
  add_foreign_key "buyer_reviews", "suppliers"
  add_foreign_key "notifications", "buyers"
  add_foreign_key "notifications", "orders"
  add_foreign_key "notifications", "suppliers"
  add_foreign_key "offers", "buyers"
  add_foreign_key "orders", "bids"
  add_foreign_key "orders", "buyers"
  add_foreign_key "orders", "offers"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "products", "bids"
  add_foreign_key "products", "offers"
  add_foreign_key "supplier_reviews", "buyers"
  add_foreign_key "supplier_reviews", "suppliers"
end
