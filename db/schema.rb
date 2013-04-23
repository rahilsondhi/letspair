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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423235018) do

  create_table "credentials", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.integer  "uid",        :null => false
    t.string   "token"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "credentials", ["user_id"], :name => "index_credentials_on_user_id"

  create_table "messages", :force => true do |t|
    t.integer  "author_id",    :null => false
    t.integer  "recipient_id", :null => false
    t.integer  "session_id",   :null => false
    t.text     "body",         :null => false
    t.datetime "created_at",   :null => false
  end

  add_index "messages", ["session_id"], :name => "index_messages_on_session_id"

  create_table "needs", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.string   "date_type"
    t.text     "description"
    t.datetime "date_suggested_one"
    t.datetime "date_suggested_two"
    t.datetime "date_suggested_three"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "needs", ["user_id"], :name => "index_needs_on_user_id"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "partner_id",           :null => false
    t.integer  "need_id"
    t.integer  "waiting_for"
    t.string   "state"
    t.text     "description"
    t.datetime "date"
    t.datetime "date_suggested_one"
    t.datetime "date_suggested_two"
    t.datetime "date_suggested_three"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "sessions", ["need_id"], :name => "index_sessions_on_need_id"
  add_index "sessions", ["partner_id"], :name => "index_sessions_on_partner_id"
  add_index "sessions", ["state"], :name => "index_sessions_on_state"
  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "github_id"
    t.string   "github_owner"
    t.string   "github_name"
    t.string   "language"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",       :null => false
    t.string   "username",    :null => false
    t.string   "name",        :null => false
    t.string   "location"
    t.datetime "last_online"
    t.string   "timezone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
