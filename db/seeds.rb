# Clear existing data
DisposalRecord.destroy_all
LocationBinType.destroy_all
BinType.destroy_all
User.destroy_all

# maybe one more for backup
user = User.new(email: "emma@test.com", password: "123456", first_name: "Emma", last_name: "Preysing")
file = URI.open("https://media.licdn.com/dms/image/D5603AQFviLMSU6nNzg/profile-displayphoto-shrink_800_800/0/1699914603422?e=1706140800&v=beta&t=-_nEa2-rLt75uyGXEdjPwaxbC3-ANx_wEsCkXfLz6hQ")
user.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
user.save!

#ELectronics

# only our bins types
bin_type_electronics = BinType.new(name: "Electronics", description: "Mobile Phones | Laptops and Tablets | Chargers and Cables | Electronic Accessories")
file_electronics = URI.open("https://onecms-res.cloudinary.com/image/upload/s--ntm1IwI3--/c_fill,g_auto,h_468,w_830/f_auto,q_auto/e-waste-recycling-bin-a-harvey-norman-outlet-jun-30---2021.jpg?itok=EkvcIQfe")
bin_type_electronics.photo.attach(io: file_electronics, filename: "nes.png", content_type: "image/png")
bin_type_electronics.save!

# either enough to show all on map, or enough for one example during presentation
location3_remote = Location.new(name: "Saturn", address: 'Voßstraße 24, 10117 Berlin')
location3_remote.save!
location4_remote = Location.new(name: "Cyberport", address: 'Friedrichstraße 50-55. 10117 Berlin')
location4_remote.save!

# same as above
location_bin_type_remote = LocationBinType.new(location: location3_remote, bin_type: bin_type_electronics )
location_bin_type_remote.save!
location_bin_type_remote = LocationBinType.new(location: location4_remote, bin_type: bin_type_electronics )
location_bin_type_remote.save!

# enough to fill index page / Dashboard.
waste_item_remote = WasteItem.new(user: user, bin_type: bin_type_electronics, name: "Remote Control")
file_remote = URI.open("https://www.popsci.com/uploads/2020/12/15/DDFO6YAVABC3FG2MPZUB7ZWQJY.jpg?auto=webp")
waste_item_remote.photo.attach(io: file_remote, filename: "nes.png", content_type: "image/png")
waste_item_remote.save!

# disposal_record enough to show the badge logic and trees on Dashboard
disposal_record_remote = DisposalRecord.new(user: user, location: location3_remote, waste_item: waste_item_remote, disposal_date: "date")
disposal_record_remote.save!


# #BULKY WASTE

bin_type_bulky = BinType.new(name: "Bulky Waste", description: "Bulky residual waste | Carpets, Timber | Electrical devices | Larger Non-Recyclable Items")
file_bulky = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rbb24.de%2Fcontent%2Fdam%2Frbb%2Frbb%2Frbb24%2F2020%2F2020_06%2Fdpa-account%2Fbsr.jpg.jpg%2Fsize%3D708x398.jpg&f=1&nofb=1&ipt=c376365f2e93893d0144a31ee61b43a76e3e07aa7e63982a4a61565e9281af9b&ipo=images")
bin_type_bulky.photo.attach(io: file_bulky, filename: "nes.png", content_type: "image/png")
bin_type_bulky.save!

# either enough to show all on map, or enough for one example during presentation
location1_Wardrobe = Location.new(name: "BSR", address: 'Behmstraße 74, 10439 Berlin')
location1_Wardrobe.save!
location2_Wardrobe = Location.new(name: "BSR", address: 'Ilsenburger Straße 18 - 20, 10589 Berlin')
location2_Wardrobe.save!
location3_Wardrobe = Location.new(name: "BSR", address: 'Fischerstraße 16, 10317 Berlin')
location3_Wardrobe.save!
location4_Wardrobe = Location.new(name: "BSR", address: 'Berliner Straße 110, 10713 Berlin')
location4_Wardrobe.save!
location5_Wardrobe = Location.new(name: "BSR", address: 'Gradestraße 73, 12347 Berlin')
location5_Wardrobe.save!

location_bin_type_Wardrobe = LocationBinType.new(location: location1_Wardrobe, bin_type: bin_type_bulky )
location_bin_type_Wardrobe.save!
location_bin_type_Wardrobe = LocationBinType.new(location: location2_Wardrobe, bin_type: bin_type_bulky )
location_bin_type_Wardrobe.save!
location_bin_type_Wardrobe = LocationBinType.new(location: location3_Wardrobe, bin_type: bin_type_bulky )
location_bin_type_Wardrobe.save!
location_bin_type_Wardrobe = LocationBinType.new(location: location4_Wardrobe, bin_type: bin_type_bulky )
location_bin_type_Wardrobe.save!
location_bin_type_Wardrobe = LocationBinType.new(location: location5_Wardrobe, bin_type: bin_type_bulky )
location_bin_type_Wardrobe.save!

# enough to fill index page / Dashboard.
waste_item_Wardrobe = WasteItem.new(user: user, bin_type: bin_type_bulky, name: "Wardrobe")
file_Wardrobe = URI.open("https://freepngimg.com/thumb/aquarium/44704-6-cupboard-hd-free-transparent-image-hq.png")
waste_item_Wardrobe.photo.attach(io: file_Wardrobe, filename: "nes.png", content_type: "image/png")
waste_item_Wardrobe.save!

disposal_record_Wardrobe = DisposalRecord.new(user: user, location: location1_Wardrobe, waste_item: waste_item_Wardrobe, disposal_date: "date")
disposal_record_Wardrobe.save!

#blue bin

# bin_type = BinType.new(name: "blue bins", description: "Container for paper and cardboard items, encompassing packaging, newspapers, magazines, catalogs, writing/printing paper, and cardboard, supporting paper recycling efforts.")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.cvRk4Pt8kSAcfZ-7EJBjKwHaE7%26pid%3DApi&f=1&ipt=096bc7093772e092e09637a82f238370f698fb685b96bbbe59928630bd0e07d6&ipo=images")
# bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# bin_type.save!

# # either enough to show all on map, or enough for one example during presentation
# location1 = Location.new(name: "HU", address: 'Unter den Linden 6, 10117 Berlin')
# location1.save!
# location2 = Location.new(name: "Jewish Museum", address: 'Lindenstraße 9-14, 10969 Berlin')
# location2.save!
# location3 = Location.new(name: "Tempodrom", address: 'Möckernstrasse 10, 10963 Berlin')
# location3.save!
# location4 = Location.new(name: "WBH", address: 'Wilhelmstraße 140, 10963 Berlin')
# location4.save!
# location5 = Location.new(name: "Mall", address: 'Leipziger Pl. 12, 10117 Berlin')
# location5.save!

# # enough to fill index page / Dashboard.

# location_bin_type = LocationBinType.new(location: location1, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location2, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location3, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location4, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location5, bin_type: bin_type )
# location_bin_type.save!


# waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "Cartons")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.gwg-guben.de%2Fs-content%2Fuploads%2F2023%2F02%2Fgwg-beitrag.png&f=1&nofb=1&ipt=4949b6d9b40446372570c41b4935eb08287ef6857726006f309b6172063fe718&ipo=images")
# waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# waste_item.save!
# waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "Newspaper")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.blog.de%2Fwp-content%2Fuploads%2F2020%2F08%2FPapiermuell-blaue-Tonne.jpg&f=1&nofb=1&ipt=b2d92f320b660f4bcca5c2fe6b7d4a6c8976cfaeff3d5e829fd07e298d59e49b&ipo=images")
# waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# waste_item.save!

# #household bin

# bin_type = BinType.new(name: "household bins", description: "Bin for residual waste that cannot be recycled, encompassing items like hygiene products and tissues, providing a disposal solution for non-recyclable household waste.")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tagesspiegel.de%2Fpotsdam%2Fpotsdam-mittelmark%2Fimages%2Fmull-in-der-potsdamer-innenstadt%2Falternates%2FBASE_21_9_W1000%2Fmuell-in-der-potsdamer-innenstadt.jpeg&f=1&nofb=1&ipt=e66c2bd62781b69bd264393a023f8510dcec18e5e125385cdee56e6fd08ee61e&ipo=images")
# bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# bin_type.save!
# # either enough to show all on map, or enough for one example during presentation
# location1 = Location.new(name: "HU", address: 'Unter den Linden 6, 10117 Berlin')
# location1.save!
# location2 = Location.new(name: "Jewish Museum", address: 'Lindenstraße 9-14, 10969 Berlin')
# location2.save!
# location3 = Location.new(name: "Tempodrom", address: 'Möckernstrasse 10, 10963 Berlin')
# location3.save!
# location4 = Location.new(name: "WBH", address: 'Wilhelmstraße 140, 10963 Berlin')
# location4.save!
# location5 = Location.new(name: "Mall", address: 'Leipziger Pl. 12, 10117 Berlin')
# location5.save!

# location_bin_type = LocationBinType.new(location: location1, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location2, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location3, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location4, bin_type: bin_type )
# location_bin_type.save!
# location_bin_type = LocationBinType.new(location: location5, bin_type: bin_type )
# location_bin_type.save!
# # enough to fill index page / Dashboard.
# waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "vacuum bag")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.staubsauger.net%2Fwp-content%2Fuploads%2Fstaubsaugerbeutel-original-no-name1.jpg&f=1&nofb=1&ipt=9d977aaa194f9abcb31eddd59679ac691e08031b9184a607e61e35268653565e&ipo=images")
# waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# waste_item.save!
# waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "ashtray")
# file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fde.academic.ru%2Fpictures%2Fdewiki%2F70%2FFull_Ashtray.jpg&f=1&nofb=1&ipt=bb26fa305a08249aace738cf86be95d0ff204b30406ab1945cfa5c37edc3c154&ipo=images")
# waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# waste_item.save!



#CLOTH


bin_type_cloth = BinType.new(name: "Clothes Donation", description: "Gently Used Clothing | Clean and Wearable Textiles | Shoes and Accessories")

file_cloth = URI.open("https://allaboutberlin.com/images/content1x/red-cross-donation-bin-berlin.jpg")
bin_type_cloth.photo.attach(io: file_cloth, filename: "nes.png", content_type: "image/png")
bin_type_cloth.save!

# either enough to show all on map, or enough for one example during presentation
location1_Shirt = Location.new(name: "motz-the-shop", address: 'Friedrichstrasse 226, 10963 Berlin')
location1_Shirt.save!
location2_Shirt = Location.new(name: "tHERAPY Recycle and Exorcise", address: 'Mariángeles Aguirre, Hallesches Ufer, 10963')
location2_Shirt.save!
location3_Shirt = Location.new(name: "Fair divider and exchange corner", address: 'Friedrichstraße 1, 10969 Berlin')
location3_Shirt.save!

location_bin_type_Shirt = LocationBinType.new(location: location1_Shirt, bin_type: bin_type_cloth )
location_bin_type_Shirt.save!
location_bin_type_Shirt = LocationBinType.new(location: location2_Shirt, bin_type: bin_type_cloth )
location_bin_type_Shirt.save!
location_bin_type_Shirt = LocationBinType.new(location: location3_Shirt, bin_type: bin_type_cloth )
location_bin_type_Shirt.save!

# enough to fill index page / Dashboard.
waste_item_Shirt = WasteItem.new(user: user, bin_type: bin_type_cloth, name: "Shirt")
file_Shirt = URI.open("https://www.bodenimages.com/productimages/r1aproductlarge/22wspr_t0896_blu_d06.jpg")
waste_item_Shirt.photo.attach(io: file_Shirt, filename: "nes.png", content_type: "image/png")
waste_item_Shirt.save!

disposal_record_Shirt = DisposalRecord.new(user: user, location: location1_Shirt, waste_item: waste_item_Shirt, disposal_date: "date")
disposal_record_Shirt.save!

#BATTERY

bin_type_Battery = BinType.new(name: "Battery Recycling", description: " AA Batteries | AAA Batteries | C Batteries | Laptop and Mobile Phone Batteries")
file_Battery = URI.open("https://allaboutberlin.com/images/content1x/lidl-battery-recycling-akku-entsorgung.jpg")
bin_type_Battery.photo.attach(io: file_Battery, filename: "nes.png", content_type: "image/png")
bin_type_Battery.save!

# either enough to show all on map, or enough for one example during presentation
location1_Battery = Location.new(name: "DM", address: 'Friedrichstraße 191. 10117 Berlin')
location1_Battery.save!
location2_Battery = Location.new(name: "Lidl", address: 'Charlottenstraße 2.  10969 Berlin')
location2_Battery.save!
location3_Battery = Location.new(name: "Rewe", address: 'Friedrichstraße 60. 10117 Berlin')
location3_Battery.save!

location_bin_type_Battery = LocationBinType.new(location: location1_Battery, bin_type: bin_type_Battery )
location_bin_type_Battery.save!
location_bin_type_Battery = LocationBinType.new(location: location2_Battery, bin_type: bin_type_Battery )
location_bin_type_Battery.save!
location_bin_type_Battery = LocationBinType.new(location: location3_Battery, bin_type: bin_type_Battery )
location_bin_type_Battery.save!

# enough to fill index page / Dashboard.
waste_item_Battery = WasteItem.new(user: user, bin_type: bin_type_Battery, name: "Battery")
file_Battery = URI.open("https://img.huffingtonpost.com/asset/5d27b8bf2600004f00044323.jpeg?ops=scalefit_720_noupscale")
waste_item_Battery.photo.attach(io: file_Battery, filename: "nes.png", content_type: "image/png")
waste_item_Battery.save!

disposal_record_Battery = DisposalRecord.new(user: user, location: location1_Battery, waste_item: waste_item_Battery, disposal_date: "date")
disposal_record_Battery.save!
