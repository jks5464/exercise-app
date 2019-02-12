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

ActiveRecord::Schema.define(version: 20190212024316) do

  create_table "client_trainer_relations", force: :cascade do |t|
    t.integer "client_id"
    t.integer "trainer_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "trainer_user_id"
    t.integer "client_user_id"
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer  "rep_count"
    t.integer  "rep_value"
    t.string   "rep_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "task_id"
    t.boolean  "completed"
  end

  add_index "exercise_sets", ["task_id"], name: "index_exercise_sets_on_task_id"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.integer  "unit_id"
  end

  add_index "goals", ["exercise_id"], name: "index_goals_on_exercise_id"
  add_index "goals", ["unit_id"], name: "index_goals_on_unit_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "measurements", force: :cascade do |t|
    t.string   "height"
    t.string   "weight"
    t.string   "body_fat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "measurements", ["user_id"], name: "index_measurements_on_user_id"

  create_table "role_assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_assignments", ["role_id"], name: "index_role_assignments_on_role_id"
  add_index "role_assignments", ["user_id"], name: "index_role_assignments_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.boolean  "completed"
  end

  add_index "tasks", ["exercise_id"], name: "index_tasks_on_exercise_id"
  add_index "tasks", ["workout_id"], name: "index_tasks_on_workout_id"

  create_table "test_dbs", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "workout_exercise_relationships", force: :cascade do |t|
    t.string   "workout_id"
    t.string   "exercise_id"
    t.integer  "sets"
    t.integer  "reps"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.integer  "user_id"
    t.boolean  "completed"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"

end
