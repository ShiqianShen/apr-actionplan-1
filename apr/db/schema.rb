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

ActiveRecord::Schema.define(version: 20151202184859) do

  create_table "action_plans", force: :cascade do |t|
    t.date     "date_of_site_visit"
    t.string   "submitter_first_name"
    t.string   "submitter_title"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "submitter_last_name"
    t.integer  "unit_id"
    t.integer  "user_id"
    t.string   "status",               default: "Incomplete", null: false
  end

  add_index "action_plans", ["unit_id"], name: "index_action_plans_on_unit_id"
  add_index "action_plans", ["user_id"], name: "index_action_plans_on_user_id"

  create_table "criterion_details", force: :cascade do |t|
    t.integer  "action_plan_id"
    t.integer  "criterion_id"
    t.date     "cd_date1"
    t.date     "cd_date2"
    t.string   "cd_field1"
    t.string   "cd_field2"
    t.string   "comments"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "criterion_details", ["action_plan_id"], name: "index_criterion_details_on_action_plan_id"
  add_index "criterion_details", ["criterion_id"], name: "index_criterion_details_on_criterion_id"
  add_index "criterion_details", ["user_id"], name: "index_criterion_details_on_user_id"

  create_table "criterion_files", force: :cascade do |t|
    t.integer  "criterion_detail_id"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "criterion_files", ["criterion_detail_id"], name: "index_criterion_files_on_criterion_detail_id"
  add_index "criterion_files", ["user_id"], name: "index_criterion_files_on_user_id"

  create_table "criterion_sub_details", force: :cascade do |t|
    t.integer  "criterion_detail_id"
    t.string   "action_item"
    t.string   "associated_tasks"
    t.string   "individuals_resp"
    t.string   "other_res_items"
    t.decimal  "cost_amt"
    t.string   "source_of_funding"
    t.date     "proj_start_date"
    t.date     "target_comp_date"
    t.string   "current_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "criterion_sub_details", ["criterion_detail_id"], name: "index_criterion_sub_details_on_criterion_detail_id"
  add_index "criterion_sub_details", ["user_id"], name: "index_criterion_sub_details_on_user_id"

  create_table "criterions", force: :cascade do |t|
    t.integer  "criterion_number"
    t.string   "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "field1",           limit: 500
    t.string   "field2",           limit: 500
  end

  create_table "units", force: :cascade do |t|
    t.string   "unit"
    t.string   "college"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

end
