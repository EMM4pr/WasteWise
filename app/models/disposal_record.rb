class DisposalRecord < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :waste_item
  has_one :bin_type, through: :waste_item

  # Calculation so the progress line cant be full - when next level - display epmty progress line
  def level_calc(current_user)
    number = current_user.disposal_records.count
    if (number % 5).zero?
      number + 0.1
    else
      number
    end
  end
end
