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

ActiveRecord::Schema.define(version: 2021_05_25_145553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_images", force: :cascade do |t|
    t.bigint "book_id"
    t.string "image_url", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_images_on_book_id"
  end

  create_table "book_reviews", force: :cascade do |t|
    t.bigint "book_id"
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_reviews_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.bigint "publisher_id"
    t.string "name", limit: 128
    t.decimal "price", precision: 10, scale: 2
    t.string "summary", limit: 1024
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 64
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorizes", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_categorizes_on_book_id"
    t.index ["category_id"], name: "index_categorizes_on_category_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_taggings_on_book_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "writings", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_writings_on_author_id"
    t.index ["book_id"], name: "index_writings_on_book_id"
  end

  add_foreign_key "book_images", "books"
  add_foreign_key "book_reviews", "books"
  add_foreign_key "books", "publishers"
  add_foreign_key "categorizes", "books"
  add_foreign_key "categorizes", "categories"
  add_foreign_key "taggings", "books"
  add_foreign_key "taggings", "tags"
  add_foreign_key "writings", "authors"
  add_foreign_key "writings", "books"
end
