class Location < ApplicationRecord
  has_many :disposal_records
  has_many :location_bin_types
  has_many :bin_types, through: :location_bin_types

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
