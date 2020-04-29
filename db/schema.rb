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

ActiveRecord::Schema.define(version: 20180508065229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",       limit: 255
    t.integer  "number"
    t.string   "neighborhood", limit: 255
    t.string   "zipcode",      limit: 255
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "state_id"
    t.string   "complement",   limit: 255
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "phone",              limit: 255
    t.string   "cellphone",          limit: 255
    t.datetime "dob"
    t.string   "rg",                 limit: 255
    t.string   "cpf",                limit: 255
    t.string   "cnpj",               limit: 255
    t.string   "state_registration", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",               limit: 255
    t.string   "career",             limit: 255
    t.boolean  "gender",                         default: true
    t.string   "phone_ddd",          limit: 255
    t.string   "cellphone_ddd",      limit: 255
    t.string   "re",                 limit: 255
    t.text     "observation"
    t.string   "audiometry",         limit: 255
  end

  create_table "devices", force: :cascade do |t|
    t.datetime "purchased_at"
    t.integer  "warantee"
    t.string   "battery",       limit: 255
    t.string   "brand",         limit: 255
    t.string   "model",         limit: 255
    t.string   "ear",           limit: 255
    t.string   "_type",         limit: 255
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "store",         limit: 255
    t.string   "other_store",   limit: 255
    t.string   "serial_number", limit: 255
  end

  create_table "states", force: :cascade do |t|
    t.string   "acronym",    limit: 255
    t.string   "name",       limit: 255
    t.integer  "capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["capital_id"], name: "index_states_on_capital_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",       null: false
    t.string   "encrypted_password",     limit: 255, default: "",       null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255, default: "Básico"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
