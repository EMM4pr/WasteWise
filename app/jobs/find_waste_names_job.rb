class FindWasteNamesJob < ApplicationJob
  queue_as :default

  def perform(waste_item_id)
    # Do something later
    waste_item = WasteItem.find(waste_item_id)
    url = waste_item.photo.url if waste_item.photo.attached?
    name = GoogleApiService.analyze_image(url)
    waste_item.update!(name: name)
  end
end
