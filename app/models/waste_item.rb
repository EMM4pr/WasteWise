class WasteItem < ApplicationRecord
  belongs_to :user
  belongs_to :bin_type
  belongs_to :category
  has_one :disposal_record
end
