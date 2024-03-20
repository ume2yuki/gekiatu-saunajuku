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

ActiveRecord::Schema.define(version: 2024_03_20_175307) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "doemu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doemu_id"], name: "index_comments_on_doemu_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "doemus", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "about"
    t.string "image"
    t.string "service"
    t.integer "user_id"
    t.integer "money"
    t.text "access"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "overall"
    t.integer "level"
    t.float "lat"
    t.float "lng"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "doemu_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doemu_id"], name: "index_likes_on_doemu_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "doemus"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "doemus"
  add_foreign_key "likes", "users"
end
