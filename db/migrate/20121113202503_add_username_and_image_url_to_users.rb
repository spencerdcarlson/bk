class AddUsernameAndImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :image_url, :string
  end
end
