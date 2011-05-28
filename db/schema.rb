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

ActiveRecord::Schema.define(:version => 20110528064816) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.integer  "budget_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budgets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "envelopes", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount",      :precision => 10, :scale => 2
    t.integer  "envelope_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email_address"
    t.string   "password_digest"
    t.date     "last_login"
    t.integer  "budget_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
