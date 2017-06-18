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

ActiveRecord::Schema.define(version: 20170618125753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "unit_id"
    t.string   "category"
    t.text     "description"
    t.integer  "urgency"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "issues", ["tenant_id"], name: "index_issues_on_tenant_id", using: :btree
  add_index "issues", ["unit_id"], name: "index_issues_on_unit_id", using: :btree

  create_table "landlords", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password"
    t.string   "password_digest"
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "landlord_id"
    t.string   "building_type"
    t.integer  "num_units"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.boolean  "pets"
    t.string   "outdoor_space"
    t.string   "neighborhood"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "units_occupied"
    t.integer  "monthly_income"
    t.string   "img"
  end

  add_index "properties", ["landlord_id"], name: "index_properties_on_landlord_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.integer  "landlord_id"
    t.integer  "property_id"
    t.integer  "unit_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "birthdate"
    t.string   "phone"
    t.string   "email"
    t.text     "bio"
    t.integer  "income"
    t.boolean  "smoker"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "late"
    t.string   "password"
  end

  add_index "tenants", ["landlord_id"], name: "index_tenants_on_landlord_id", using: :btree
  add_index "tenants", ["property_id"], name: "index_tenants_on_property_id", using: :btree
  add_index "tenants", ["unit_id"], name: "index_tenants_on_unit_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "name"
    t.integer  "rent"
    t.boolean  "occupied"
    t.date     "lease_end"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.string   "washer_dryer"
    t.string   "parking"
    t.integer  "floor"
    t.string   "utilities"
    t.boolean  "furnished"
    t.integer  "sq_feet"
    t.integer  "landlord_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "lease_img"
    t.date     "lease_start"
  end

  add_index "units", ["landlord_id"], name: "index_units_on_landlord_id", using: :btree
  add_index "units", ["property_id"], name: "index_units_on_property_id", using: :btree

  add_foreign_key "issues", "tenants"
  add_foreign_key "issues", "units"
  add_foreign_key "properties", "landlords"
  add_foreign_key "tenants", "landlords"
  add_foreign_key "tenants", "properties"
  add_foreign_key "tenants", "units"
  add_foreign_key "units", "landlords"
  add_foreign_key "units", "properties"
end
