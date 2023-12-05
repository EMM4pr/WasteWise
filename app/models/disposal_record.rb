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

  def user_level(current_user)
    level = level_calc(current_user)
    user_level = level
    # if level.between?(30,35)
    #   user_level = level
    # elsif level.between?(25,30)
    #   user_level = level
    # elsif level.between?(20,25)
    #   user_level = level
    # elsif level.between?(15,20)
    #   user_level = level
    # elsif level.between?(10,15)
    #   user_level = level
    # elsif level.between?(5,10)
    #   user_level = level
    # elsif level.between?(1,5)
    #   user_level = level
    # end
  end
end
