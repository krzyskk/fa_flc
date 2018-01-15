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

ActiveRecord::Schema.define(version: 20180102122112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "card_id"
    t.string "answer"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_answers_on_card_id"
    t.index ["lesson_id"], name: "index_answers_on_lesson_id"
  end

  create_table "cards", force: :cascade do |t|
    t.text "front"
    t.text "back"
    t.integer "correct_answers", default: 0, null: false
    t.integer "wrong_answers", default: 0, null: false
    t.integer "near_answers", default: 0, null: false
    t.integer "hint_answers", default: 0, null: false
    t.datetime "last_showed_at"
    t.bigint "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "started_at"
    t.bigint "deck_id"
    t.integer "correct_answers", default: 0, null: false
    t.integer "wrong_answers", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_lessons_on_deck_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_questions_on_card_id"
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "cards"
  add_foreign_key "answers", "lessons"
  add_foreign_key "cards", "decks"
  add_foreign_key "decks", "users"
  add_foreign_key "lessons", "decks"
  add_foreign_key "questions", "cards"
  add_foreign_key "questions", "lessons"
end
