class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
