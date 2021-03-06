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

ActiveRecord::Schema.define(version: 20170904222129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_managers_on_league_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.decimal  "private_value", precision: 5, scale: 2
    t.decimal  "public_value",  precision: 5, scale: 2
    t.integer  "roster_id"
    t.integer  "league_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["league_id"], name: "index_players_on_league_id", using: :btree
    t.index ["position"], name: "index_players_on_position", using: :btree
    t.index ["roster_id"], name: "index_players_on_roster_id", using: :btree
  end

  create_table "rosters", force: :cascade do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "budget",     default: 200
    t.integer  "RB",         default: 0
    t.integer  "WR",         default: 0
    t.integer  "QB",         default: 0
    t.integer  "TE",         default: 0
    t.integer  "K",          default: 0
    t.integer  "DEF",        default: 0
    t.index ["manager_id"], name: "index_rosters_on_manager_id", using: :btree
  end

  add_foreign_key "managers", "leagues"
  add_foreign_key "players", "leagues"
  add_foreign_key "rosters", "managers"
end
