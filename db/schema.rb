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

ActiveRecord::Schema.define(version: 20141126212736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "judgments", force: true do |t|
    t.integer  "prediction_id",                          null: false
    t.integer  "user_id",                                null: false
    t.string   "status",        default: "undetermined"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judgments", ["prediction_id"], name: "index_judgments_on_prediction_id", using: :btree
  add_index "judgments", ["user_id"], name: "index_judgments_on_user_id", using: :btree

  create_table "predictions", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "statement",  null: false
    t.datetime "deadline",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "predictions", ["user_id"], name: "index_predictions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wagers", force: true do |t|
    t.integer  "prediction_id", null: false
    t.integer  "probability",   null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wagers", ["prediction_id"], name: "index_wagers_on_prediction_id", using: :btree
  add_index "wagers", ["user_id"], name: "index_wagers_on_user_id", using: :btree

end
