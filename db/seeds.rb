require "open-uri"
# Category.destroy_all
DisposalRecord.destroy_all
WasteItem.destroy_all
LocationBinType.destroy_all
Location.destroy_all
BinType.destroy_all
User.destroy_all

# maybe one more for backup
user = User.new(email: "emma@test.com", password: "123456", first_name: "Emma", last_name: "Preysing")
file = URI.open("https://media.licdn.com/dms/image/D5603AQFviLMSU6nNzg/profile-displayphoto-shrink_800_800/0/1699914603422?e=1706140800&v=beta&t=-_nEa2-rLt75uyGXEdjPwaxbC3-ANx_wEsCkXfLz6hQ")
user.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
user.save!

# only our bins types
bin_type = BinType.new(name: "Electronics recycling bins", description: "For used electronics and objects with the WEEE logo. These bins are in electronics stores, hardware stores, and some supermarkets.")
file = URI.open("https://allaboutberlin.com/images/content1x/lidl-battery-recycling-akku-entsorgung.jpg")
bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bin_type.save!

# either enough to show all on map, or enough for one example during presentation
location1 = Location.new(name: "DM", address: 'Friedrichstraße 191. 10117 Berlin')
location1.save!
location2 = Location.new(name: "Lidl", address: 'Charlottenstraße 2.  10969 Berlin')
location2.save!
location3 = Location.new(name: "Rewe", address: 'Friedrichstraße 60. 10117 Berlin')
location3.save!
location4 = Location.new(name: "Cyberport", address: 'Friedrichstraße 50-55. 10117 Berlin')
location4.save!
location5 = Location.new(name: "Rossman", address: 'Rudi-Dutschke-Straße 29. 10969 Berlin')
location5.save!

# same as above
location_bin_type = LocationBinType.new(location: location1, bin_type: bin_type )
location_bin_type.save!
location_bin_type = LocationBinType.new(location: location2, bin_type: bin_type )
location_bin_type.save!
location_bin_type = LocationBinType.new(location: location3, bin_type: bin_type )
location_bin_type.save!
location_bin_type = LocationBinType.new(location: location4, bin_type: bin_type )
location_bin_type.save!
location_bin_type = LocationBinType.new(location: location5, bin_type: bin_type )
location_bin_type.save!

# enough to fill index page / Dashboard.
waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "Remote Control")
file = URI.open("https://img.huffingtonpost.com/asset/5d27b8bf2600004f00044323.jpeg?ops=scalefit_720_noupscale")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!

# disposal_record enough to show the badge logic and trees on Dashboard
disposal_record = DisposalRecord.new(user: user, location: location1, waste_item: waste_item, disposal_date: "date")
disposal_record.save!

