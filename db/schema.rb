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

ActiveRecord::Schema.define(version: 2021_08_03_223128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shorten_urls", force: :cascade do |t|
    t.text "long_url"
    t.string "short_token", default: ""
    t.string "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statistics_urls", force: :cascade do |t|
    t.bigint "shorten_url_id", null: false
    t.string "accesed_ip", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shorten_url_id"], name: "index_statistics_urls_on_shorten_url_id"
  end

  add_foreign_key "statistics_urls", "shorten_urls"
end
