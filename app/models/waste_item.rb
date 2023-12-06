class WasteItem < ApplicationRecord
  belongs_to :user
  belongs_to :bin_type
  has_one :disposal_record
  has_one_attached :photo
  after_commit :find_waste_item_name, on: :create

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def find_waste_item_name
    FindWasteNamesJob.perform_now(self.id)
  end

end
