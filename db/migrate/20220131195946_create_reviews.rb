class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :location_id
      t.integer :user_id
      t.text :activities
      t.text :review
      t.integer :baby_rating
      t.integer :toddler_rating
      t.integer :preschool_rating
      t.integer :school_age_rating
      t.integer :adult_rating
      t.integer :general_rating
      t.boolean :favorite
      t.boolean :want_to_visit
      t.boolean :visited
      t.integer :time_spent
      t.integer :price_per_person
      t.integer :fun_factor
      t.integer :educational_value
      t.timestamps
    end
  end
end
