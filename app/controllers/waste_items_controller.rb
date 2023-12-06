class WasteItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  before_action :set_waste_items, only: %i[show]

  def show
    @locations = @waste_item.bin_type.locations
    # @locations = Location.joins(:bin_types).where(bin_types: { id: @waste_item.bin_type.id })
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        marker_html: render_to_string(partial: "marker"),
        info_window_html: render_to_string(partial: "info_window", locals: {location: location})
      }
    end
    @disposal_record = DisposalRecord.new
  end

  def search

  #   if params[:query].present?
  #     sql_subquery = <<~SQL
  #     @bin_types.name ILIKE :query
  #     OR waste_item.name ILIKE :query
  #     SQL
  #     @bin_types = @bin_types.joins(:waste_item).where(sql_subquery, query: "%#{params[:query]}%")
  #   else
  #     @bin_types = BinType.all
  #   end
  # end

    # if params[:query]
    #   @wasteitems = WasteItem.where("title ILIKE ")
    # end

    # @locations = Location.joins(:bin_types).where(bin_types: { id: @waste_item.bin_type.id })
    # @markers = @locations.geocoded.map do |location|
    #   {
    #     lat: location.latitude,
    #     lng: location.longitude,
    #     marker_html: render_to_string(partial: "marker"),
    #     info_window_html: render_to_string(partial: "info_window", locals: {location: location})
    #   }
    # end


    # @waste_item = params[:query]


    if params[:query].present?
      @bin_types = [WasteItem.find_by(name: params[:query]).bin_type]
      @locations = @bin_types.first.locations
      # @waste_items = WasteItem.search_by_name(params[:query])
      # @bin_types = BinType.search_by_waste_item(@waste_item)
      # @locations = Location.joins(:bin_types, :location_bin_types).where(waste_items: { name: params[:query] })
      # @locations = Location.joins(:bin_types).where(bin_types: { id: @waste_item.bin_type.id })
    else
      @bin_types = BinType.all
      @locations = Location.all
      # @locations = Location.joins(:bin_types).where(bin_types: { id: bin_type.id })
    end

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
    @disposal_records = current_user.disposal_records
    @waste_items = WasteItem.order('created_at DESC')
    @locations = Location.new
    # @categories = Category.new
    @waste_items = @waste_items.where(tag: params[:query]) if params[:query].present?
  end

  def new
    @waste_item = WasteItem.new
    @trash = params[:result]
  end

  def create
    @waste_item = WasteItem.new(waste_item_params)
    @waste_item.user = current_user
    @waste_item.bin_type = BinType.all.sample
    # @waste_item.category = Category.all.sample
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

  private

  def set_waste_items
    @waste_item = WasteItem.find(params[:id])
  end

  def waste_item_params
    params.require(:waste_item).permit(:name, :photo, :photo_url)
  end
end
