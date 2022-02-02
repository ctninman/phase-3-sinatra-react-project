class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.integer :user_id
      t.string :first_initial
      t.integer :age
    end
  end
end
