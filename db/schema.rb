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

ActiveRecord::Schema.define(:version => 20120421202942) do

  create_table "appraisal_forms", :force => true do |t|
    t.string   "name"
    t.text     "comments"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "appraisals", :force => true do |t|
    t.string   "name"
    t.integer  "appraisal_form_id"
    t.integer  "employee_id"
    t.integer  "appraiser_id"
    t.integer  "review_period_id"
    t.string   "percent_complete"
    t.string   "raw_score"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "raw_possible"
    t.string   "raw_percentage"
    t.string   "raw_5_point"
    t.integer  "reviewer_id"
    t.integer  "certifier_id"
    t.datetime "approved_at"
    t.string   "approved_by"
    t.datetime "certified_at"
    t.string   "certified_by"
  end

  add_index "appraisals", ["appraiser_id"], :name => "index_appraisals_on_appraiser_id"
  add_index "appraisals", ["approved_at"], :name => "index_appraisals_on_approved_at"
  add_index "appraisals", ["approved_by"], :name => "index_appraisals_on_approved_by"
  add_index "appraisals", ["certified_at"], :name => "index_appraisals_on_certified_at"
  add_index "appraisals", ["certified_by"], :name => "index_appraisals_on_certified_by"
  add_index "appraisals", ["certifier_id"], :name => "index_appraisals_on_certifier_id"
  add_index "appraisals", ["employee_id"], :name => "index_appraisals_on_employee_id"
  add_index "appraisals", ["review_period_id"], :name => "index_appraisals_on_review_period_id"
  add_index "appraisals", ["reviewer_id"], :name => "index_appraisals_on_reviewer_id"

  create_table "appraiser_appraisal_comments", :force => true do |t|
    t.integer  "appraisal_id"
    t.text     "comments"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "appraiser_appraisal_comments", ["appraisal_id"], :name => "index_appraiser_appraisal_comments_on_appraisal_id"

  create_table "appraiser_section_comments", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "section_id"
    t.text     "comments"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "appraiser_section_comments", ["appraisal_id"], :name => "index_appraiser_section_comments_on_appraisal_id"
  add_index "appraiser_section_comments", ["section_id"], :name => "index_appraiser_section_comments_on_section_id"

  create_table "assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "comments", :force => true do |t|
    t.integer  "appraisal_id"
    t.string   "section_id"
    t.integer  "commenter_id"
    t.text     "note"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "comment_type"
    t.integer  "feedback_topic_id"
  end

  add_index "comments", ["appraisal_id"], :name => "index_comments_on_appraisal_id"
  add_index "comments", ["comment_type"], :name => "index_comments_on_comment_type"
  add_index "comments", ["commenter_id"], :name => "index_comments_on_commenter_id"
  add_index "comments", ["feedback_topic_id"], :name => "index_comments_on_feedback_topic_id"
  add_index "comments", ["section_id"], :name => "index_comments_on_section_id"

  create_table "employments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "position_id"
    t.integer  "store_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "employments", ["end_date"], :name => "index_employments_on_end_date"
  add_index "employments", ["person_id"], :name => "index_employments_on_person_id"
  add_index "employments", ["position_id"], :name => "index_employments_on_position_id"
  add_index "employments", ["start_date"], :name => "index_employments_on_start_date"
  add_index "employments", ["store_id"], :name => "index_employments_on_store_id"

  create_table "feedback_topic_assignments", :force => true do |t|
    t.integer  "appraisal_form_id"
    t.integer  "feedback_topic_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "feedback_topic_assignments", ["appraisal_form_id"], :name => "index_feedback_topic_assignments_on_appraisal_form_id"
  add_index "feedback_topic_assignments", ["feedback_topic_id"], :name => "index_feedback_topic_assignments_on_feedback_topic_id"

  create_table "feedback_topics", :force => true do |t|
    t.string   "name"
    t.text     "form_text"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "form_assignments", :force => true do |t|
    t.integer  "appraisal_form_id"
    t.integer  "appraisal_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "form_assignments", ["appraisal_form_id"], :name => "index_form_assignments_on_appraisal_form_id"
  add_index "form_assignments", ["appraisal_id"], :name => "index_form_assignments_on_appraisal_id"

  create_table "pay_rates", :force => true do |t|
    t.decimal  "rate",        :precision => 8, :scale => 2
    t.string   "cadence"
    t.string   "status"
    t.datetime "approved_at"
    t.string   "approved_by"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "person_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "pay_rates", ["person_id"], :name => "index_pay_rates_on_person_id"
  add_index "pay_rates", ["status"], :name => "index_pay_rates_on_status"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "last_review_date"
    t.string   "current_rate_of_pay"
    t.string   "avg_weekly_hours"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
    t.string   "employee_number"
  end

  add_index "people", ["employee_number"], :name => "index_people_on_employee_number"
  add_index "people", ["first_name"], :name => "index_people_on_first_name"
  add_index "people", ["last_name"], :name => "index_people_on_last_name"
  add_index "people", ["last_review_date"], :name => "index_people_on_last_review_date"
  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.string   "min_pay"
    t.string   "max_pay"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "exempt"
    t.string   "pay_cadence"
    t.integer  "rank"
  end

  add_index "positions", ["pay_cadence"], :name => "index_positions_on_pay_cadence"
  add_index "positions", ["rank"], :name => "index_positions_on_rank"

  create_table "questionings", :force => true do |t|
    t.integer  "question_id"
    t.integer  "section_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "questionings", ["question_id"], :name => "index_questionings_on_question_id"
  add_index "questionings", ["section_id"], :name => "index_questionings_on_section_id"

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.text     "form_text"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "created_by"
    t.string   "updated_by"
  end

  add_index "responses", ["answer"], :name => "index_responses_on_answer"
  add_index "responses", ["appraisal_id"], :name => "index_responses_on_appraisal_id"
  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"

  create_table "review_periods", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "default_non_exempt_form_id"
    t.integer  "default_exempt_form_id"
    t.string   "created_by"
    t.string   "updated_by"
  end

  add_index "review_periods", ["default_exempt_form_id"], :name => "index_review_periods_on_default_exempt_form_id"
  add_index "review_periods", ["default_non_exempt_form_id"], :name => "index_review_periods_on_default_non_exempt_form_id"
  add_index "review_periods", ["start_date"], :name => "index_review_periods_on_start_date"

  create_table "role_assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "role_assignments", ["role_id"], :name => "index_role_assignments_on_role_id"
  add_index "role_assignments", ["user_id"], :name => "index_role_assignments_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sectionings", :force => true do |t|
    t.integer  "section_id"
    t.integer  "form_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sectionings", ["form_id"], :name => "index_sectionings_on_form_id"
  add_index "sectionings", ["section_id"], :name => "index_sectionings_on_section_id"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.text     "appraiser_comments"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "appraisal_form_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "store_authorizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "store_authorizations", ["store_id"], :name => "index_store_authorizations_on_store_id"
  add_index "store_authorizations", ["user_id"], :name => "index_store_authorizations_on_user_id"

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "updated_by"
    t.string   "created_by"
  end

  create_table "users", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "login"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "created_by"
    t.string   "updated_by"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
