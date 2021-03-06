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

ActiveRecord::Schema.define(version: 20171028190113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "result_id"
    t.integer "white_player_id", null: false
    t.integer "black_player_id", null: false
    t.integer "table_number"
    t.integer "stone_color"
    t.integer "handicap"
    t.index ["result_id"], name: "index_games_on_result_id"
    t.index ["round_id"], name: "index_games_on_round_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "rank", null: false
    t.string "aga_number", null: false
    t.date "membership_exp_date"
    t.decimal "rating", null: false
    t.string "chapter_affiliation", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "email"
    t.string "zip"
  end

  create_table "results", force: :cascade do |t|
    t.integer "outcome", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_results_on_game_id"
  end

  create_table "round_statuses", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "round_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_round_statuses_on_player_id"
    t.index ["round_id"], name: "index_round_statuses_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "tournament_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "tournament_registrations", force: :cascade do |t|
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.bigint "tournament_id"
    t.index ["player_id"], name: "index_tournament_registrations_on_player_id"
    t.index ["tournament_id"], name: "index_tournament_registrations_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.date "begin_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "results"
  add_foreign_key "games", "rounds"
  add_foreign_key "results", "games"
  add_foreign_key "round_statuses", "players"
  add_foreign_key "round_statuses", "rounds"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "tournament_registrations", "players"
  add_foreign_key "tournament_registrations", "tournaments"
  add_foreign_key "tournaments", "users"
end
