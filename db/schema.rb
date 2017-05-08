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

ActiveRecord::Schema.define(version: 20170508175259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characteristics_leads", id: false, force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "characteristic_id", null: false
    t.index ["characteristic_id", "lead_id"], name: "index_characteristics_leads_on_characteristic_id_and_lead_id"
    t.index ["lead_id", "characteristic_id"], name: "index_characteristics_leads_on_lead_id_and_characteristic_id"
  end

  create_table "leads", force: :cascade do |t|
    t.float "lat", null: false
    t.float "lng", null: false
    t.string "address", null: false
    t.integer "bedrooms", default: 0, null: false
    t.integer "bathrooms", default: 0, null: false
    t.string "built_surface", default: "0 sqft", null: false
    t.integer "pool_type"
    t.integer "kitchen_condition"
    t.integer "bathroom_condition"
    t.boolean "renovated", default: false
    t.text "renovated_description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "renovated_spent", default: ""
    t.integer "timeline_to_sell"
    t.integer "looking_for_another"
    t.integer "reasons_for_selling"
    t.string "own_valuation", default: ""
    t.text "anything_else", default: ""
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "password_salt"
    t.string "provider"
    t.string "uid"
    t.string "first_name", null: false
    t.string "last_name"
    t.string "phone", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leads", "users"
end
