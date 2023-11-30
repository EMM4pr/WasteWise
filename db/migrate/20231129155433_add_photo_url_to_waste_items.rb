class AddPhotoUrlToWasteItems < ActiveRecord::Migration[7.1]
  def change
    add_column :waste_items, :photo_url, :string
  end
end
