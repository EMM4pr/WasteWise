class WasteItemsController < ApplicationController
  before_action :set_wasteitem, only: %i[new create]

  def new
    @waste_item = Waste_items.new
  end

  def create
    @waste_item = Waste_items.new(wasteitem_params)
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
    @waste_item = Waste_item.find(params[:id])
  end
end
