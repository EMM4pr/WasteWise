class FindWasteNamesJob < ApplicationJob
  queue_as :default

  def perform(waste_item_id)
    # Do something later
    waste_item = WasteItem.find(waste_item_id)
    url = waste_item.photo.url if waste_item.photo.attached?
    name = GoogleApiService.analyze_image(url)
    bin_type = WasteItem.find_by(name: name).bin_type
    waste_item.update!(name: name, bin_type: bin_type)
  end
end
