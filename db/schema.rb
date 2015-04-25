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

ActiveRecord::Schema.define(version: 20150425155517) do

  create_table "attribute_histories", force: :cascade do |t|
    t.string   "entity",         limit: 50,   null: false
    t.integer  "entity_id",      limit: 8,    null: false
    t.string   "attribute_name", limit: 100,  null: false
    t.string   "from_value",     limit: 1024
    t.string   "to_value",       limit: 1024
    t.string   "user_id",        limit: 100
    t.string   "reason",         limit: 100
    t.string   "comments",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "attribute_histories", ["created_at"], name: "index_attribute_histories_on_created_at", using: :btree
  add_index "attribute_histories", ["entity_id"], name: "index_attribute_histories_on_entity_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "provider",     limit: 255
    t.string   "uid",          limit: 255
    t.string   "image",        limit: 255
    t.text     "token",        limit: 65535
    t.text     "token_secret", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "status",        limit: 255
    t.integer  "user_id",       limit: 4,     null: false
    t.integer  "listed_by",     limit: 4,     null: false
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.text     "boundary",      limit: 65535
    t.string   "property_type", limit: 255
    t.string   "sub_type",      limit: 255
    t.string   "landmark",      limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "property_detail_histories", force: :cascade do |t|
    t.integer  "property_detail_id", limit: 8,  null: false
    t.string   "from",               limit: 20
    t.string   "to",                 limit: 20, null: false
    t.string   "event",              limit: 50
    t.string   "user_id",            limit: 20
    t.string   "change_reason",      limit: 50
    t.string   "change_sub_reason",  limit: 50
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "property_details", force: :cascade do |t|
    t.integer  "property_id", limit: 8,     null: false
    t.string   "name",        limit: 255
    t.string   "value",       limit: 255
    t.text     "comments",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "property_infos", force: :cascade do |t|
    t.integer  "property_id", limit: 8,     null: false
    t.string   "name",        limit: 255
    t.string   "details",     limit: 255
    t.string   "source",      limit: 255
    t.text     "comments",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
