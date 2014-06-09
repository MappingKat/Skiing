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

ActiveRecord::Schema.define(:version => 20140609151032) do

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "type"
    t.string   "level"
    t.string   "favorite_resorts"
    t.boolean  "off_piste"
    t.string   "state"
    t.text     "picture"
    t.text     "bio"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "user_id"
  end

  create_table "resort_relationships", :force => true do |t|
    t.integer  "instructor_id"
    t.integer  "resort_id"
    t.string   "instructor_state"
    t.boolean  "favorite"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "resort_relationships", ["instructor_id"], :name => "index_resort_relationships_on_instructor_id"
  add_index "resort_relationships", ["resort_id"], :name => "index_resort_relationships_on_resort_id"

  create_table "resorts", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "region"
    t.string   "area"
    t.text     "map"
    t.text     "image"
    t.string   "min_new_snow_24h"
    t.string   "max_new_snow_24h"
    t.integer  "min_average_base_depth"
    t.integer  "max_average_base_depth"
    t.boolean  "lift_status"
    t.date     "forecast_date"
    t.integer  "day_max_temp"
    t.integer  "night_max_temp"
    t.text     "night_weather_description"
    t.text     "day_weather_description"
    t.integer  "avalanche_warning"
    t.integer  "day_min_temp"
    t.integer  "night_min_temp"
    t.integer  "daily_pass_adults"
    t.integer  "daily_pass_kids"
    t.integer  "six_days_pass_adults"
    t.integer  "six_days_pass_kids"
    t.string   "resort_type"
    t.string   "resort_status"
    t.text     "surface_conditions"
    t.text     "snow_last_48hours"
    t.text     "night_grooming"
    t.text     "weather_forecast"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
