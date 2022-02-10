class AddCityPhotoAndEmail < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :photo, :string
    add_column :users, :email, :string
    remove_column :reviews, :educational_value, :integer
  end
end
