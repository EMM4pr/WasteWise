class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # WasteItem.joins(:bin_type).where(bin_type: {name: "Yellow Bin"})
  # Filter by bin type name
  # User.last.disposal_records.joins(waste_item: :bin_type).where(bin_type: {name: "Gray Bin"})

  def home
  end

  def about
  end

  def dashboard
    @locations = Location.all
    # if user_signed_in?
    @waste_items = current_user.waste_items
    @users = current_user.waste_items
    @disposal_records = current_user.disposal_records
    @bin_types_count = current_user.disposal_records.joins(waste_item: :bin_type).group("bin_types.name").count
    # @bin_type_name = current_user.disposal_records.joins(waste_item: :bin_type).pluck("bin_types.name")
    @bin_type_id = current_user.disposal_records.joins(waste_item: :bin_type).pluck("bin_types.id")

    # @bin_type_name = current_user.disposable_records.
    # @bin_type_description = current_user.disposable_records
    # Bin Type A => x mal in disposal_record of the user
    # {"Blue Paper Bin"=>3, "Yellow Bag"=>3, "Yellow Bin"=>4}
    # @all_values = bin_type_count.values
    # "" * current_user.disposable_records.count
    # end
  end
end
