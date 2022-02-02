class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.integer :city_id
      t.string :type
      t.boolean :outdoor
      t.boolean :indoor
      t.string :description
      t.string :photo
      t.string :address
      t.string :borough
      t.string :neighborhood
      t.timestamps
    end
  end
end
