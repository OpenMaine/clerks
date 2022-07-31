# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_23_224927) do
  create_table "campaign_reports", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "report_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_reports_on_campaign_id"
  end

  create_table "campaign_schedule_as", force: :cascade do |t|
    t.integer "campaign_report_id", null: false
    t.date "date"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "occupation"
    t.string "employer"
    t.integer "schedule_a_type"
    t.integer "amount"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_report_id"], name: "index_campaign_schedule_as_on_campaign_report_id"
  end

  create_table "campaign_schedule_bs", force: :cascade do |t|
    t.integer "campaign_report_id", null: false
    t.date "date"
    t.string "payee"
    t.integer "schedule_b_type"
    t.string "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_report_id"], name: "index_campaign_schedule_bs_on_campaign_report_id"
  end

  create_table "campaign_schedule_cs", force: :cascade do |t|
    t.integer "campaign_report_id", null: false
    t.text "lender"
    t.integer "balance_at_beginning"
    t.integer "amount_loaned"
    t.integer "amount_repaid"
    t.integer "amount_forgiven"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_report_id"], name: "index_campaign_schedule_cs_on_campaign_report_id"
  end

  create_table "campaign_schedule_ds", force: :cascade do |t|
    t.date "date"
    t.text "creditor"
    t.text "purpose"
    t.integer "amount"
    t.integer "campaign_report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_report_id"], name: "index_campaign_schedule_ds_on_campaign_report_id"
  end

  create_table "campaign_schedule_fs", force: :cascade do |t|
    t.integer "campaign_report_id", null: false
    t.integer "receipts"
    t.integer "payments"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_report_id"], name: "index_campaign_schedule_fs_on_campaign_report_id"
  end

  create_table "campaign_treasurers", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_treasurers_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "election_id", null: false
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "telephone"
    t.string "email"
    t.integer "office"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_campaigns_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaign_reports", "campaigns"
  add_foreign_key "campaign_schedule_as", "campaign_reports"
  add_foreign_key "campaign_schedule_bs", "campaign_reports"
  add_foreign_key "campaign_schedule_cs", "campaign_reports"
  add_foreign_key "campaign_schedule_ds", "campaign_reports"
  add_foreign_key "campaign_schedule_fs", "campaign_reports"
  add_foreign_key "campaign_treasurers", "campaigns"
  add_foreign_key "campaigns", "elections"
end
