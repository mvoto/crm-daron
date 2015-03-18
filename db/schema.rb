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

ActiveRecord::Schema.define(version: 20150318015300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "neighborhood"
    t.string   "zipcode"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "state_id"
    t.string   "complement"
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "cellphone"
    t.datetime "dob"
    t.string   "rg"
    t.string   "cpf"
    t.string   "cnpj"
    t.string   "state_registration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "career"
    t.boolean  "gender",             default: true
    t.string   "phone_ddd"
    t.string   "cellphone_ddd"
    t.integer  "re"
  end

  create_table "devices", force: true do |t|
    t.datetime "purchased_at"
    t.integer  "warantee"
    t.string   "battery"
    t.integer  "serial_number"
    t.string   "brand"
    t.string   "model"
    t.string   "ear"
    t.string   "_type"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "store"
    t.string   "other_store"
  end

  create_table "states", force: true do |t|
    t.string   "acronym"
    t.string   "name"
    t.integer  "capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["capital_id"], name: "index_states_on_capital_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
