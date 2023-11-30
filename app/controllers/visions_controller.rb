
class VisionsController < ApplicationController
  def analyze
    # @result = KindsOfBinService.determine_bin(params[:image_url])
    @result = GoogleApiService.analyze_image(params[@waste_item.photo.url])

    redirect_to visonresult_path(result: @result)
  end

  def vision_analyze
    @trash = params[:result]
  end
end
