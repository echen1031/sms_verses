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

ActiveRecord::Schema.define(:version => 20131202012136) do

  create_table "bible_verses", :force => true do |t|
    t.string   "reference"
    t.string   "book"
    t.integer  "book_num"
    t.integer  "chapter_num"
    t.integer  "verse_num"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_subscriptions", :force => true do |t|
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "remind_hour"
    t.string   "sms_id"
    t.boolean  "send_day_1"
    t.boolean  "send_day_2"
    t.boolean  "send_day_3"
    t.boolean  "send_day_4"
    t.boolean  "send_day_5"
    t.boolean  "send_day_6"
    t.boolean  "send_day_7"
    t.string   "time_zone"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "phone"
    t.string   "time_zone"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "verse_references", :force => true do |t|
    t.string   "book"
    t.integer  "chapter"
    t.integer  "verse_number"
    t.string   "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
