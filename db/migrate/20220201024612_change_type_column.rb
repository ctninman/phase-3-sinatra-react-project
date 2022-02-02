class ChangeTypeColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :type, :string
    add_column :locations, :activity_type, :string
  end
end
