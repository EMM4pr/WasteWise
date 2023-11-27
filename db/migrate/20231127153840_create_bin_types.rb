class CreateBinTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :bin_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
