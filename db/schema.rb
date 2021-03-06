# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_11_210642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "card_id"
    t.string "answer", default: "", null: false
    t.string "status", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_answers_on_card_id"
    t.index ["lesson_id"], name: "index_answers_on_lesson_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "front", default: "", null: false
    t.string "back", default: "", null: false
    t.boolean "active", default: true, null: false
    t.boolean "memorized", default: false, null: false
    t.integer "correct_answers", default: 0, null: false
    t.integer "wrong_answers", default: 0, null: false
    t.integer "empty_answers", default: 0, null: false
    t.integer "word_class", default: 0, null: false
    t.datetime "last_showed_at"
    t.datetime "marked_as_memorized"
    t.datetime "last_correct_answer"
    t.datetime "last_wrong_answer"
    t.bigint "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
    t.index ["front", "back", "word_class", "deck_id"], name: "index_cards_on_front_and_back_and_word_class_and_deck_id", unique: true
  end

  create_table "decks", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "deck_id"
    t.integer "memorized", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct", default: 0
    t.integer "wrong", default: 0
    t.integer "empty", default: 0
    t.index ["deck_id"], name: "index_lessons_on_deck_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
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
end
