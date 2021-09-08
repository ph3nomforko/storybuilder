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

ActiveRecord::Schema.define(version: 2021_09_08_154004) do

  create_table "characters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "story_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "species"
    t.string "role"
    t.integer "level"
    t.text "description"
    t.index ["story_id"], name: "index_characters_on_story_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "journals", force: :cascade do |t|
    t.text "content"
    t.integer "story_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_journals_on_story_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.text "story_outline"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "stories"
  add_foreign_key "characters", "users"
  add_foreign_key "journals", "stories"
  add_foreign_key "journals", "users"
  add_foreign_key "stories", "users"
end
