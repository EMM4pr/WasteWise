class DisposalRecord < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :waste_item
end
