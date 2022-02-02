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

ActiveRecord::Schema.define(version: 2022_02_01_024612) do

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kids", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_initial"
    t.integer "age"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location_name"
    t.integer "city_id"
    t.boolean "outdoor"
    t.boolean "indoor"
    t.string "description"
    t.string "photo"
    t.string "address"
    t.string "borough"
    t.string "neighborhood"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity_type"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
    t.text "activities"
    t.text "review"
    t.integer "baby_rating"
    t.integer "toddler_rating"
    t.integer "preschool_rating"
    t.integer "school_age_rating"
    t.integer "adult_rating"
    t.integer "general_rating"
    t.boolean "favorite"
    t.boolean "want_to_visit"
    t.boolean "visited"
    t.integer "time_spent"
    t.integer "price_per_person"
    t.integer "fun_factor"
    t.integer "educational_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.integer "city_id"
    t.integer "number_of_kids"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
