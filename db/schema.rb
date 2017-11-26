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

ActiveRecord::Schema.define(version: 20171126005527) do

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "game_manager_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rights", default: 1
    t.index ["game_id"], name: "index_game_manager_assignments_on_game_id"
    t.index ["user_id", "game_id"], name: "index_game_manager_assignments_on_user_id_and_game_id", unique: true
    t.index ["user_id"], name: "index_game_manager_assignments_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "path"
    t.text "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gametype_id"
    t.index ["gametype_id"], name: "index_games_on_gametype_id"
  end

  create_table "gametypes", force: :cascade do |t|
    t.string "name"
    t.string "shortname"
    t.text "description"
    t.text "configs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
