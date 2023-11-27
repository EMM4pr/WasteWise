class CreateWasteItems < ActiveRecord::Migration[7.1]
  def change
    create_table :waste_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bin_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
