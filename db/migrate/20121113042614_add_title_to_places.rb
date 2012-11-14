class AddTitleToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :title, :text
  end
end
