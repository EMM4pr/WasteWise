class AddPhotoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :boolean, null: false, default: false
  end
end
