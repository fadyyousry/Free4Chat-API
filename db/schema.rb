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

ActiveRecord::Schema.define(version: 2020_08_04_200101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_chats_on_owner_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["chat_id"], name: "index_connections_on_chat_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "message"
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chats", "users", column: "owner_id"
  add_foreign_key "connections", "chats"
  add_foreign_key "connections", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
