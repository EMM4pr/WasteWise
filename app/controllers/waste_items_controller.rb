class WasteItemsController < ApplicationController
  before_action :set_waste_items, only: %i[show ]

  def show
    @locations = Location.joins(:bin_types).where(bin_types: { id: @waste_item.bin_type.id })
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        marker_html: render_to_string(partial: "marker"),
        info_window_html: render_to_string(partial: "info_window", locals: {location: location})
      }
    end
  end

  def index
    @waste_items = WasteItem.all.order(:id)
    @locations = Location.new
    @categories = Category.new
    @waste_items = @waste_items.where(tag: params[:query]) if params[:query].present?
  end

  def new
    @waste_item = WasteItem.new
    @trash = params[:result]
  end

  def create
    @waste_item = WasteItem.new(waste_item_params)
    # save user of wasteitem appliance as current user
    @waste_item.user = current_user
    @waste_item.bin_type = BinType.all.sample
    @waste_item.category = Category.all.sample
    if @waste_item.save!
      # find_waste_item_name(@waste_item.photo.url)
      respond_to do |format|
        format.html { redirect_to waste_item_path(@waste_item), notice: 'your waste_items appliance was successfully created.' }
        format.text { render plain: "#{request.protocol}#{request.host_with_port}/waste_items/#{@waste_item.id}" }
      end
      # raise
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
  end

  private

  def set_waste_items
    @waste_item = WasteItem.find(params[:id])
  end

  def waste_item_params
    params.require(:waste_item).permit(:name, :photo, :photo_url)
  end
end
