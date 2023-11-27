class CreateDisposalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :disposal_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :waste_item, null: false, foreign_key: true
      t.date :disposal_date

      t.timestamps
    end
  end
end
