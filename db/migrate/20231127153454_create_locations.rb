class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
