# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140331065943) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buyers", force: true do |t|
    t.integer  "product_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "product_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity",                            default: 1
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",      precision: 10, scale: 0
  end

  create_table "orders", force: true do |t|
    t.integer  "buyer_id"
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "seller_id"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "seasion_id"
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.boolean  "status"
    t.integer  "color_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "product_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasions", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sellers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "state"
    t.string   "status",           default: "Inactive"
    t.string   "city"
    t.string   "mobile"
    t.string   "buisness_name"
    t.string   "buisness_address"
    t.string   "buisness_state"
    t.string   "buisness_city"
    t.string   "buisness_mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.integer  "product_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "status",                 default: true
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
