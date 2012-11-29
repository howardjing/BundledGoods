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

ActiveRecord::Schema.define(:version => 20121129014358) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "instructions", :force => true do |t|
    t.text     "content"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "instructions", ["number"], :name => "index_instructions_on_number", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "previous_question_id"
    t.integer  "duration"
    t.datetime "time_started"
    t.text     "values"
    t.text     "effects"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "instruction_id",       :null => false
  end

  add_index "questions", ["instruction_id"], :name => "index_questions_on_instruction_id"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "lab_number"
    t.integer  "age"
    t.integer  "current_question_id"
    t.string   "year"
    t.string   "major"
    t.string   "gender"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
