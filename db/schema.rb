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

ActiveRecord::Schema.define(version: 2021_07_01_180157) do

  create_table "authors", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.date "born_date", null: false
  end

  create_table "authors_books", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.index ["author_id", "book_id"], name: "author_id", unique: true
    t.index ["book_id"], name: "book_id"
  end

  create_table "books", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.boolean "published", null: false
    t.integer "publisher_id", null: false
    t.index ["publisher_id"], name: "publisher_id"
  end

  create_table "likes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "ref_type", limit: 45
    t.integer "ref_id"
    t.index ["user_id", "ref_type", "ref_id"], name: "user_id", unique: true
  end

  create_table "publishers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45, null: false
  end

  create_table "teste_rakes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "born_date"
    t.float "valor_real"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45
    t.date "born_date"
  end

  add_foreign_key "authors_books", "authors", name: "authors_books_ibfk_1"
  add_foreign_key "authors_books", "books", name: "authors_books_ibfk_2"
  add_foreign_key "books", "publishers", name: "books_ibfk_1"
  add_foreign_key "likes", "users", name: "likes_ibfk_1"
end
