class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :user_rating

      t.timestamps
    end
  end
end
