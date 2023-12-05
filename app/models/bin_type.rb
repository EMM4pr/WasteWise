class BinType < ApplicationRecord
  has_many :waste_items, dependent: :destroy
  has_many :location_bin_types
  has_one_attached :photo
end
