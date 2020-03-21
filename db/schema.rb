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

ActiveRecord::Schema.define(version: 2020_03_21_120301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.boolean "resolved", default: false
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_chats_on_recipient_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "kind"
    t.string "street"
    t.string "postcode"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_institutions_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "kind"
    t.integer "status"
    t.string "name"
    t.integer "amount"
    t.string "identifier"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_id"
    t.index ["chat_id"], name: "index_items_on_chat_id"
    t.index ["institution_id"], name: "index_items_on_institution_id"
  end

  create_table "messages", force: :cascade do |t|
    t.boolean "archived", default: false
    t.text "text", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_id"
    t.bigint "user_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "users", column: "recipient_id"
  add_foreign_key "chats", "users", column: "sender_id"
end
