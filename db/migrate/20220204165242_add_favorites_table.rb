class AddFavoritesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :location_id
      t.integer :user_id
      t.boolean :want_to_visit
      t.boolean :favorite
      t.boolean :visited
    end
    remove_column :reviews, :want_to_visit, :boolean
    remove_column :reviews, :visited, :boolean
    remove_column :reviews, :favorite, :boolean
    remove_column :reviews, :time_spent, :boolean
    remove_column :reviews, :fun_factor, :boolean
  end
end
