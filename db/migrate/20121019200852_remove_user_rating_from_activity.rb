class RemoveUserRatingFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :user_rating
  end

  def down
    add_column :activities, :user_rating, :integer
  end
end
