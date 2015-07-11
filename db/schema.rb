# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150514131305) do

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",          null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.string   "translit"
    t.text     "short_content"
    t.text     "content"
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "view_id"
    t.integer  "view_id_for_child"
    t.integer  "position",          default: 0
    t.integer  "view_count",        default: 0
    t.boolean  "status",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "view_translations", force: :cascade do |t|
    t.integer  "view_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "view_translations", ["locale"], name: "index_view_translations_on_locale"
  add_index "view_translations", ["view_id"], name: "index_view_translations_on_view_id"

  create_table "views", force: :cascade do |t|
    t.string  "path"
    t.integer "view_type"
  end

end
