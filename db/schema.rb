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

ActiveRecord::Schema.define(version: 20180409205814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "date"
    t.decimal "max_temp"
    t.decimal "average_temp"
    t.decimal "min_temp"
    t.decimal "average_humidity"
    t.decimal "average_visibility"
    t.decimal "average_windspeed"
    t.decimal "precipitation"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.datetime "date_time"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_trips", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "trip_id"
    t.index ["station_id"], name: "index_station_trips_on_station_id"
    t.index ["trip_id"], name: "index_station_trips_on_trip_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.integer "dock_count"
    t.string "city"
    t.string "installation_date"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.string "start_date"
    t.string "start_station_name"
    t.integer "start_station_id"
    t.string "end_date"
    t.string "end_station_name"
    t.integer "end_station_id"
    t.integer "bike_id"
    t.string "subscription_type"
    t.integer "zip_code"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "station_trips", "stations"
  add_foreign_key "station_trips", "trips"
end
