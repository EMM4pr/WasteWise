class Category < ApplicationRecord
  has_many :waste_items, dependent: :destroy
end
