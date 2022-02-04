class MoveFreeLocationsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :price_per_person, :integer
    add_column :locations, :free, :boolean
  end
end
