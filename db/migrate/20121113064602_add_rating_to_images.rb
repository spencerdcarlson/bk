class AddRatingToImages < ActiveRecord::Migration
  def change
    add_column :images, :rating, :decimal
  end
end
