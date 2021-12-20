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

ActiveRecord::Schema.define(version: 2021_12_19_213420) do

  create_table "cargoes", force: :cascade do |t|
    t.string "name", null: false
    t.string "value", null: false
    t.integer "mass", null: false
    t.integer "reg_number", null: false
    t.integer "route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_cargoes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "ship_id"
    t.integer "from_port_id"
    t.integer "to_port_id"
    t.time "departure_time"
    t.time "arrival_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_port_id"], name: "index_routes_on_from_port_id"
    t.index ["ship_id"], name: "index_routes_on_ship_id"
    t.index ["to_port_id"], name: "index_routes_on_to_port_id"
  end

  create_table "ship_ports", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ships", force: :cascade do |t|
    t.integer "reg_number", null: false
    t.string "name", null: false
    t.integer "load_capacity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ships_logs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_type"
    t.text "ship_data"
  end

  add_foreign_key "cargoes", "routes", on_delete: :cascade
  add_foreign_key "routes", "ship_ports", column: "from_port_id", on_delete: :cascade
  add_foreign_key "routes", "ship_ports", column: "to_port_id", on_delete: :cascade
  add_foreign_key "routes", "ships", on_delete: :cascade
end
