class Location < ApplicationRecord
  has_many :disposal_records
  has_many :location_bin_types
end
