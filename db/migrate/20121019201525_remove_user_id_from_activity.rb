class RemoveUserIdFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :user_id
  end

  def down
    add_column :activities, :user_id, :integer
  end
end
