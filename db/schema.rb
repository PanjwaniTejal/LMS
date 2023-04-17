# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_17_175311) do

  create_table "course_offerings", force: :cascade do |t|
    t.string "name"
    t.string "instructor"
    t.datetime "date"
    t.integer "min_employees"
    t.integer "max_employees"
    t.string "course_offering_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "registrations", force: :cascade do |t|
    t.string "employee_email"
    t.integer "course_offering_id", null: false
    t.string "status"
    t.string "registration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_offering_id"], name: "index_registrations_on_course_offering_id"
  end

  add_foreign_key "registrations", "course_offerings"
end
