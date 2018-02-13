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

ActiveRecord::Schema.define(version: 20180213213724) do

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rights", default: 1
    t.index ["game_id"], name: "index_assignments_on_game_id"
    t.index ["user_id", "game_id"], name: "index_assignments_on_user_id_and_game_id", unique: true
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "command_jobs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.string "worker"
    t.string "params"
    t.text "output", default: ""
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_command_jobs_on_game_id"
    t.index ["user_id"], name: "index_command_jobs_on_user_id"
  end

  create_table "configs", force: :cascade do |t|
    t.integer "gametype_id"
    t.integer "priority"
    t.string "configurator"
    t.string "file"
    t.string "key"
    t.integer "datatype"
    t.integer "constraint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gametype_id"], name: "index_configurations_on_gametype_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "path"
    t.text "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gametype_id"
    t.integer "status", default: 0
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

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
