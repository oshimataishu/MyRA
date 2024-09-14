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

ActiveRecord::Schema.define(version: 2024_09_14_090603) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "book_comments", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "customer_id", null: false
    t.text "comment", null: false
    t.integer "page_number"
    t.text "quote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_comments_on_book_id"
    t.index ["customer_id"], name: "index_book_comments_on_customer_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "title", null: false
    t.string "author", null: false
    t.string "company"
    t.integer "status", default: 0, null: false
    t.integer "star", default: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_books_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birth_day", null: false
    t.string "institute", default: "無所属"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "magazines", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "#<ActiveRecord::ConnectionAdapters::SQLite3::TableDefinition:0x00000001088010c0>"
  end

  create_table "researcher_thesis_rels", force: :cascade do |t|
    t.integer "thesis_id", null: false
    t.integer "researcher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["researcher_id"], name: "index_researcher_thesis_rels_on_researcher_id"
    t.index ["thesis_id"], name: "index_researcher_thesis_rels_on_thesis_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "theses", force: :cascade do |t|
    t.integer "magazine_id", null: false
    t.string "title", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magazine_id"], name: "index_theses_on_magazine_id"
  end

  create_table "thesis_comments", force: :cascade do |t|
    t.integer "thesis_id", null: false
    t.integer "customer_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_thesis_comments_on_customer_id"
    t.index ["thesis_id"], name: "index_thesis_comments_on_thesis_id"
  end

  create_table "todo_comments", force: :cascade do |t|
    t.integer "todo_id", null: false
    t.integer "customer_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_todo_comments_on_customer_id"
    t.index ["todo_id"], name: "index_todo_comments_on_todo_id"
  end

  create_table "todo_genres", force: :cascade do |t|
    t.integer "todo_id", null: false
    t.integer "customer_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_todo_genres_on_customer_id"
    t.index ["todo_id"], name: "index_todo_genres_on_todo_id"
  end

  create_table "todos", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "customer_id", null: false
    t.string "title", null: false
    t.datetime "deadline", null: false
    t.integer "status", default: 0, null: false
    t.integer "priority", default: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_todos_on_customer_id"
    t.index ["genre_id"], name: "index_todos_on_genre_id"
  end

  add_foreign_key "book_comments", "books"
  add_foreign_key "book_comments", "customers"
  add_foreign_key "books", "customers"
  add_foreign_key "researcher_thesis_rels", "researchers"
  add_foreign_key "researcher_thesis_rels", "theses"
  add_foreign_key "theses", "magazines"
  add_foreign_key "thesis_comments", "customers"
  add_foreign_key "thesis_comments", "theses"
  add_foreign_key "todo_comments", "customers"
  add_foreign_key "todo_comments", "todos"
  add_foreign_key "todo_genres", "customers"
  add_foreign_key "todo_genres", "todos"
  add_foreign_key "todos", "customers"
  add_foreign_key "todos", "genres"
end
