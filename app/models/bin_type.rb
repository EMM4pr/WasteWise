class BinType < ApplicationRecord
  has_many :waste_items, dependent: :destroy
  has_many :location_bin_types
  has_many :locations, through: :location_bin_types
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_waste_item,
  against: [ :name ],
  associated_against: {
    waste_items: [ :name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

end
