# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 7) do

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courseworks", :force => true do |t|
    t.string   "title"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courseworks_listings", :id => false, :force => true do |t|
    t.integer "coursework_id"
    t.integer "listing_id"
  end

  create_table "graders", :force => true do |t|
    t.string   "name"
    t.string   "pri_phone"
    t.string   "p_ph_type"
    t.string   "sec_phone"
    t.string   "s_ph_type"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "grader_id"
    t.integer  "student_id"
    t.string   "disposition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "DRS_ID"
    t.string   "FRSB_ID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
