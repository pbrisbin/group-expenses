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

ActiveRecord::Schema.define(:version => 20130216190216) do

  create_table "groups", :force => true do |t|
    t.string "name",       :default => "", :null => false
    t.string "join_token",                 :null => false
  end

  add_index "groups", ["join_token"], :name => "index_groups_on_join_token", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "email",    :null => false
    t.string "password", :null => false
    t.string "confirm"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
