class WasteItemsController < ApplicationController
  before_action :set_wasteitem, only: %i[new create]

  def index
    @waste_items = WasteItem.all.order(:id)
    @locations = Location.new
    @categories = Category.new
    @waste_items = @waste_items.where(tag: params[:query]) if params[:query].present?
  end

  def new
    @waste_item = Waste_items.new
  end

  def create
    @waste_item = Waste_items.new(waste_item_params)
    # save user of wasteitem appliance as current user
    @waste_item.user = current_user
    if @waste_item.save! # ! stop execution @ prob
      redirect_to waste_item_path(@waste_item), notice: 'your waste_items appliance was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_waste_items
    @waste_item = Waste_item.find(params[:id])
  end

  def waste_item_params
    params.require(:waste_item).permit(:name)
  end
end
