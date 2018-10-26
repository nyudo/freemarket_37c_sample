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

ActiveRecord::Schema.define(version: 20181026071103) do

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "kana_family_name", null: false
    t.string "kana_first_name", null: false
    t.string "email_address", null: false
    t.string "password", null: false
    t.date "birthday", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "residentill_name"
    t.integer "phone_number", null: false
    t.integer "postal_code", null: false
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.index ["nickname"], name: "index_users_on_nickname"
  end

end
