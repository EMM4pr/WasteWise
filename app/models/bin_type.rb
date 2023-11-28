class BinType < ApplicationRecord
  has_many :waste_items, dependent: :destroy
  has_many :location_bin_types
end
