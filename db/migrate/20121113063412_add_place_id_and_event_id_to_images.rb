class AddPlaceIdAndEventIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :place_id, :integer
    add_column :images, :event_id, :integer
  end
end
