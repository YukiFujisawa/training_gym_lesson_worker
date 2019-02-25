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

ActiveRecord::Schema.define(version: 2019_02_06_021655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "operating_companies", force: :cascade do |t|
    t.string "operating_company_name", null: false
    t.string "home_page_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_code", null: false
    t.string "shop_name", null: false
    t.bigint "operating_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operating_company_id"], name: "index_shops_on_operating_company_id"
    t.index ["shop_code"], name: "index_shops_on_shop_code"
  end

  add_foreign_key "shops", "operating_companies"
end
