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

ActiveRecord::Schema.define(:version => 20130128041841) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "connections", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "start_date"
    t.string   "end_date"
    t.string   "role"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "linked_in_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "phone"
    t.string   "founded"
    t.string   "video"
    t.string   "email"
    t.text     "description"
    t.string   "middstart"
    t.string   "millenium_interns"
    t.string   "vcet"
    t.string   "operations_in_midd"
    t.string   "midd_employees"
    t.string   "picture"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "author"
    t.string   "class_year"
    t.string   "role"
    t.string   "email"
    t.string   "linked_in"
    t.string   "linked_in_token"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "picture"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "title"
    t.string   "password"
  end

  create_table "references", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
