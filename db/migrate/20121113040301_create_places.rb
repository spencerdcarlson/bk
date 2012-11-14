class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :activity_id
      t.integer :zip_code
      t.text :location
      t.text :directions
      t.text :hours

      t.timestamps
    end
  end
end
