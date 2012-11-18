class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.time :time
      t.integer :place_id
      t.string :recurring
      t.text :description

      t.timestamps
    end
  end
end
