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

ActiveRecord::Schema.define(:version => 20140615122419) do

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

  create_table "flaggings", :force => true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flaggings"

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], :name => "index_forem_categories_on_slug", :unique => true

  create_table "forem_forums", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], :name => "index_forem_forums_on_slug", :unique => true

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], :name => "index_forem_topics_on_slug", :unique => true
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "profile_resorts", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "resort_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profile_resorts", ["profile_id"], :name => "index_profile_resorts_on_profile_id"
  add_index "profile_resorts", ["resort_id"], :name => "index_profile_resorts_on_resort_id"

  create_table "profile_specialities", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "speciality_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "profile_specialities", ["profile_id"], :name => "index_profile_specialities_on_profile_id"
  add_index "profile_specialities", ["speciality_id"], :name => "index_profile_specialities_on_speciality_id"

  create_table "profiles", :force => true do |t|
    t.string   "prefered"
    t.string   "level"
    t.string   "favorite_resorts"
    t.text     "specialities"
    t.string   "state"
    t.string   "profile_picture"
    t.text     "bio"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
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
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "area_id"
    t.string   "website"
    t.integer  "lift_count"
    t.integer  "run_count"
    t.boolean  "requested",                  :default => false
    t.integer  "button_max_temp"
    t.integer  "button_min_temp"
    t.integer  "top_max_temp"
    t.integer  "top_min_temp"
    t.integer  "chance_of_snow"
    t.integer  "total_snow_fall"
    t.integer  "button_max_temp_fahrenheit"
    t.integer  "button_min_temp_fahrenheit"
    t.integer  "top_max_temp_fahrenheit"
    t.integer  "top_min_temp_fahrenheit"
    t.string   "day_zero_day_title"
    t.string   "day_zero_day_text"
    t.string   "day_one_day_title"
    t.string   "day_one_day_text"
    t.string   "day_two_day_title"
    t.string   "day_two_day_text"
    t.string   "day_three_day_title"
    t.string   "day_three_day_text"
    t.string   "day_four_day_title"
    t.string   "day_four_day_text"
    t.string   "day_five_day_title"
    t.string   "day_five_day_text"
    t.string   "day_six_day_title"
    t.string   "day_six_day_text"
    t.string   "day_seven_day_title"
    t.string   "day_seven_day_text"
    t.string   "day_zero_night_title"
    t.string   "day_zero_night_text"
    t.string   "day_one_night_title"
    t.string   "day_one_night_text"
    t.string   "day_two_night_title"
    t.string   "day_two_night_text"
    t.string   "day_three_night_title"
    t.string   "day_three_night_text"
    t.string   "day_four_night_title"
    t.string   "day_four_night_text"
    t.string   "day_five_night_title"
    t.string   "day_five_night_text"
    t.string   "day_six_night_title"
    t.string   "day_six_night_text"
    t.string   "search"
    t.string   "icon_day_zero"
    t.string   "icon_day_one"
    t.string   "icon_day_two"
    t.string   "icon_day_three"
    t.string   "icon_day_four"
    t.string   "icon_day_five"
    t.string   "icon_day_six"
  end

  create_table "specialities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",               :null => false
    t.string   "encrypted_password",     :default => "",               :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,                :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "uid"
    t.string   "provider"
    t.boolean  "forem_admin",            :default => false
    t.string   "forem_state",            :default => "pending_review"
    t.boolean  "forem_auto_subscribe",   :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
