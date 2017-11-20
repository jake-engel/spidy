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

ActiveRecord::Schema.define(version: 20171120153835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "date"
    t.string "location"
    t.string "picture", default: "SpidyLogo.svg"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "freelancers_id"
    t.index ["freelancers_id"], name: "index_experiences_on_freelancers_id"
  end

  create_table "freelancers", force: :cascade do |t|
    t.integer "hourly_pay"
    t.text "summary"
    t.integer "completed_jobs", default: 0
    t.float "avg_rating", default: 3.0
    t.string "currency", default: "€"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_freelancers_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "offer_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_messages_on_offer_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "price"
    t.string "price_unit", default: "hr"
    t.bigint "freelancer_id"
    t.integer "budget"
    t.text "description"
    t.integer "status", default: 1
    t.integer "rating", default: 5
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelancer_id"], name: "index_offers_on_freelancer_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "freelancers_id"
    t.index ["freelancers_id"], name: "index_skills_on_freelancers_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "photo", default: "https://developer.appway.com/filesystem/d6912741f1280a6128b983842c487477225fc90a34614d857290b935c8c2e54a736ac48da2a39d13db50853310e7a9807e5611b45cc9e299/avatar.svg"
    t.string "location"
    t.boolean "admin", default: false
    t.boolean "freelancer", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "freelancers", "users"
  add_foreign_key "messages", "offers"
  add_foreign_key "messages", "users"
  add_foreign_key "offers", "freelancers"
  add_foreign_key "offers", "users"
end
