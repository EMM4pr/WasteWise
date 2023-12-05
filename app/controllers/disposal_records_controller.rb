class DisposalRecordsController < ApplicationController
  # before_action :set_disposal_record, only: %i[show edit update destroy]

  def create
    @disposal_record = DisposalRecord.new
    @waste_item = WasteItem.find(disposal_record_params[:waste_item_id])

    @disposal_record.user = current_user
    @disposal_record.waste_item = @waste_item
    @disposal_record.location = @waste_item.bin_type.location_bin_types.first.location

    if @disposal_record.save
      redirect_to root_path, notice: 'Disposal record was successfully created.'
    end
  end

  # def destroy
  #   @disposal_record.destroy
  # end

  private

  def set_disposal_record
    @disposal_record = DisposalRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disposal_record_params
    params.require(:disposal_record).permit(:waste_item_id) # Add your actual attributes here
  end
end
