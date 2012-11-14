class AddActivityIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :activity_id, :integer
  end
end
