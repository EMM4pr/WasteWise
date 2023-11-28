class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # WasteItem.joins(:bin_type).where(bin_type: {name: "Yellow Bin"})
  # Filter by bin type name
  # User.last.disposal_records.joins(waste_item: :bin_type).where(bin_type: {name: "Gray Bin"})

  def home
  end

  def dashboard
    @locations = Location.all
    @waste_items = current_user.waste_items
    @users = current_user.waste_items
    @disposal_record = current_user.disposal_records
    @bin_types_count = current_user.disposal_records.joins(waste_item: :bin_type).group("bin_types.name").count
    # Bin Type A => x mal in disposal_record of the user
    # {"Blue Paper Bin"=>3, "Yellow Bag"=>3, "Yellow Bin"=>4}
    # @all_values = bin_type_count.values
    # "" * current_user.disposable_records.count
  end
end
