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

ActiveRecord::Schema.define(:version => 20120815041517) do

  create_table "answers", :force => true do |t|
    t.integer  "response_id"
    t.boolean  "selected"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["name"], :name => "index_answers_on_name"

  create_table "bundles", :force => true do |t|
    t.float   "lambda",      :default => 1.0
    t.integer "question_id"
    t.integer "number"
    t.float   "value",       :default => 0.0
    t.float   "utility",     :default => 0.0
  end

  create_table "bundles_goods", :id => false, :force => true do |t|
    t.integer "bundle_id"
    t.integer "good_id"
  end

  create_table "combos", :force => true do |t|
    t.integer "question_id"
    t.float   "price"
    t.float   "lambda"
    t.float   "utility"
    t.float   "value"
  end

  create_table "explanations", :force => true do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.string  "content"
  end

  add_index "explanations", ["content"], :name => "index_explanations_on_content"

  create_table "goods", :force => true do |t|
    t.float   "price",       :default => 1.0
    t.integer "question_id"
    t.integer "number"
    t.float   "value"
  end

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "number"
    t.boolean  "display_equation", :default => false
    t.boolean  "random_duration",  :default => false
    t.integer  "duration"
  end

  create_table "responses", :force => true do |t|
    t.integer  "duration"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "end_time"
    t.text     "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "lab_number"
    t.integer  "age"
    t.string   "year"
    t.string   "major"
    t.string   "gender"
  end

end
