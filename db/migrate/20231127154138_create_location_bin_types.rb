class CreateLocationBinTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :location_bin_types do |t|
      t.references :location, null: false, foreign_key: true
      t.references :bin_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
