class RemoveCategoryIDfromWasteItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :waste_items, :category_id
  end
end
