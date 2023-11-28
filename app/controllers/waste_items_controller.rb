class WasteItemsController < ApplicationController
  before_action :set_waste_items, only: %i[create show]

  def show
    @locations = Location.joins(:bin_types).where(bin_types: { id: @waste_item.bin_type.id })
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @waste_item = WasteItem.new
  end

  def create
    @waste_item = WasteItem.new(wasteitem_params)
    # save user of wasteitem appliance as current user
    if user_signed_in?
      @waste_item.user = current_user
    end
    if @waste_item.save! # ! stop execution @ prob
      redirect_to waste_item_path(@waste_item), notice: 'your waste_items appliance was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_waste_items
    @waste_item = WasteItem.find(params[:id])
  end
end
