class VisionsController < ApplicationController
  def analyze
    # @result = KindsOfBinService.determine_bin(params[:image_url])
    @result = GoogleApiService.analyze_image(params[:image_url])
    redirect_to root_path(result: @result)
  end

  def vision_analyze
    @trash = params[:result]
  end
end
