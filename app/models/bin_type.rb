class BinType < ApplicationRecord
  has_many :waste_items
  has_many :location_bin_types
end
