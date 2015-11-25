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

ActiveRecord::Schema.define(version: 20151125034826) do

  create_table "action_plans", force: :cascade do |t|
    t.date     "date_of_site_visit"
    t.string   "submission_or_update",      limit: 255
    t.date     "submission_or_update_date"
    t.string   "submitter_first_name",      limit: 255
    t.string   "submitter_title",           limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "submitter_last_name",       limit: 255
    t.integer  "unit_id",                   limit: 4
    t.integer  "user_id",                   limit: 4
  end

  add_index "action_plans", ["unit_id"], name: "index_action_plans_on_unit_id", using: :btree
  add_index "action_plans", ["user_id"], name: "index_action_plans_on_user_id", using: :btree

  create_table "criterion_details", force: :cascade do |t|
    t.integer  "action_plan_id", limit: 4
    t.integer  "criterion_id",   limit: 4
    t.date     "cd_date1"
    t.date     "cd_date2"
    t.string   "cd_field1",      limit: 255
    t.string   "cd_field2",      limit: 255
    t.string   "comments",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "criterion_details", ["action_plan_id"], name: "index_criterion_details_on_action_plan_id", using: :btree
  add_index "criterion_details", ["criterion_id"], name: "index_criterion_details_on_criterion_id", using: :btree

  create_table "criterion_files", force: :cascade do |t|
    t.integer  "criterion_detail_id", limit: 4
    t.string   "name",                limit: 255
    t.string   "attachment",          limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "criterion_files", ["criterion_detail_id"], name: "index_criterion_files_on_criterion_detail_id", using: :btree

  create_table "criterion_sub_details", force: :cascade do |t|
    t.integer  "criterion_detail_id", limit: 4
    t.string   "action_item",         limit: 255
    t.string   "associated_tasks",    limit: 255
    t.string   "individuals_resp",    limit: 255
    t.string   "other_res_items",     limit: 255
    t.decimal  "cost_amt",                        precision: 10
    t.string   "source_of_funding",   limit: 255
    t.date     "proj_start_date"
    t.date     "target_comp_date"
    t.string   "current_status",      limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "criterion_sub_details", ["criterion_detail_id"], name: "index_criterion_sub_details_on_criterion_detail_id", using: :btree

  create_table "criterions", force: :cascade do |t|
    t.integer  "criterion_number", limit: 4
    t.string   "description",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "field1",           limit: 500
    t.string   "field2",           limit: 500
  end

  create_table "units", force: :cascade do |t|
    t.string   "unit",       limit: 255
    t.string   "college",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "username",   limit: 255
    t.string   "email",      limit: 255
    t.string   "role",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "action_plans", "units"
  add_foreign_key "action_plans", "users"
  add_foreign_key "criterion_details", "action_plans"
  add_foreign_key "criterion_details", "criterions"
  add_foreign_key "criterion_files", "criterion_details"
  add_foreign_key "criterion_sub_details", "criterion_details"
end
