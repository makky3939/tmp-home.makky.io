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

ActiveRecord::Schema.define(version: 20150809025635) do

  create_table "atmospheres", force: :cascade do |t|
    t.integer  "log_id",     limit: 4
    t.float    "value",      limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "atmospheres", ["log_id"], name: "index_atmospheres_on_log_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "name",             limit: 32,             null: false
    t.string   "crypted_password", limit: 32,             null: false
    t.string   "salt",             limit: 32,             null: false
    t.integer  "roll",             limit: 4,  default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "humidities", force: :cascade do |t|
    t.integer  "log_id",     limit: 4
    t.float    "value",      limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "humidities", ["log_id"], name: "index_humidities_on_log_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "atmosphere_id",  limit: 4
    t.integer  "humidity_id",    limit: 4
    t.integer  "temperature_id", limit: 4
    t.integer  "location_id",    limit: 4, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "logs", ["atmosphere_id"], name: "index_logs_on_atmosphere_id", using: :btree
  add_index "logs", ["humidity_id"], name: "index_logs_on_humidity_id", using: :btree
  add_index "logs", ["location_id"], name: "index_logs_on_location_id", using: :btree
  add_index "logs", ["temperature_id"], name: "index_logs_on_temperature_id", using: :btree

  create_table "temperatures", force: :cascade do |t|
    t.integer  "log_id",     limit: 4
    t.float    "value",      limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "temperatures", ["log_id"], name: "index_temperatures_on_log_id", using: :btree

end
