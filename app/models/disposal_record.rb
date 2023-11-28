class DisposalRecord < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :waste_item
  has_one :bin_type, through: :waste_item
end
