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

ActiveRecord::Schema.define(:version => 20110511070756) do

  create_table "absence_requests", :force => true do |t|
    t.integer  "taskrequests_step_id"
    t.string   "absence_type"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "college_notes", :force => true do |t|
    t.integer  "college_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colleges", :force => true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "irregular_performance_approvals", :force => true do |t|
    t.integer  "taskrequests_step_id"
    t.boolean  "verdict"
    t.text     "motivation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "irregular_performance_requests", :force => true do |t|
    t.integer  "taskrequests_step_id"
    t.string   "event"
    t.datetime "from"
    t.datetime "to"
    t.string   "employee"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "new_employee_requests", :force => true do |t|
    t.integer  "taskrequests_step_id"
    t.string   "osn"
    t.text     "motivation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.integer  "step_id"
    t.string   "name"
    t.string   "value"
    t.string   "table"
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.integer  "task_id"
    t.string   "label"
    t.string   "name"
    t.integer  "executer_id"
    t.boolean  "self"
    t.boolean  "superior"
    t.boolean  "synchronous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taskrequests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taskrequests_steps", :force => true do |t|
    t.integer  "taskrequest_id"
    t.integer  "step_id"
    t.boolean  "current"
    t.integer  "executer_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
