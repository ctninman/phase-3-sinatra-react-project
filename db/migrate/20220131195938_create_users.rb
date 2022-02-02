class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.integer :city_id
      t.integer :number_of_kids
      t.string :photo 
      t.timestamps
    end
  end
end
