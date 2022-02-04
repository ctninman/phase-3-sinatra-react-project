class RemoveActivitiesColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :activities, :text
  end
end
