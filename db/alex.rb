bin_type = BinType.new(name: "bulky waste bins", description: "Bin designed for bulky residual waste that cannot be recycled, such as carpets, timber, and electrical devices, ensuring proper disposal of larger non-recyclable items.")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rbb24.de%2Fcontent%2Fdam%2Frbb%2Frbb%2Frbb24%2F2020%2F2020_06%2Fdpa-account%2Fbsr.jpg.jpg%2Fsize%3D708x398.jpg&f=1&nofb=1&ipt=c376365f2e93893d0144a31ee61b43a76e3e07aa7e63982a4a61565e9281af9b&ipo=images")
bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bin_type.save!

# either enough to show all on map, or enough for one example during presentation
location1 = Location.new(name: "BSR", address: 'Behmstraße 74, 10439 Berlin')
location1.save!
location2 = Location.new(name: "BSR", address: 'Ilsenburger Straße 18 - 20, 10589 Berlin')
location2.save!
location3 = Location.new(name: "BSR", address: 'Fischerstraße 16, 10317 Berlin')
location3.save!
location4 = Location.new(name: "BSR", address: 'Berliner Straße 110, 10713 Berlin')
location4.save!
location5 = Location.new(name: "BSR", address: 'Gradestraße 73, 12347 Berlin')
location5.save!

# enough to fill index page / Dashboard.
waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "Broken Couch")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffreestuff.co.nz%2Fcache%2Flisting_images%2F53686%2F20180418_122334_w1200_h1200_ct_ccm.jpg&f=1&nofb=1&ipt=beeed94a1aab29cc58ec05923832f78416bdfc9e5d7b29923567a62cbab5fc2b&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!

waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "Old TV")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.kleinanzeigen.de%2Fapi%2Fv1%2Fprod-ads%2Fimages%2Fc2%2Fc2ddd91d-6030-447b-95ce-7a97c03ac4b1%3Frule%3D%24_59.JPG&f=1&nofb=1&ipt=3e1c4752fa96050266196f37a1937eb7251a541520d419c445117fee1dccc7f9&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!




bin_type = BinType.new(name: "blue bins", description: "Container for paper and cardboard items, encompassing packaging, newspapers, magazines, catalogs, writing/printing paper, and cardboard, supporting paper recycling efforts.")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.cvRk4Pt8kSAcfZ-7EJBjKwHaE7%26pid%3DApi&f=1&ipt=096bc7093772e092e09637a82f238370f698fb685b96bbbe59928630bd0e07d6&ipo=images")
bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bin_type.save!

# either enough to show all on map, or enough for one example during presentation
location1 = Location.new(name: "HU", address: 'Unter den Linden 6, 10117 Berlin')
location1.save!
location2 = Location.new(name: "Jewish Museum", address: 'Lindenstraße 9-14, 10969 Berlin')
location2.save!
location3 = Location.new(name: "Tempodrom", address: 'Möckernstrasse 10, 10963 Berlin')
location3.save!
location4 = Location.new(name: "WBH", address: 'Wilhelmstraße 140, 10963 Berlin')
location4.save!
location5 = Location.new(name: "Mall", address: 'Leipziger Pl. 12, 10117 Berlin')
location5.save!

# enough to fill index page / Dashboard.
waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "cartons")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.gwg-guben.de%2Fs-content%2Fuploads%2F2023%2F02%2Fgwg-beitrag.png&f=1&nofb=1&ipt=4949b6d9b40446372570c41b4935eb08287ef6857726006f309b6172063fe718&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!

waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "newspaper")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.blog.de%2Fwp-content%2Fuploads%2F2020%2F08%2FPapiermuell-blaue-Tonne.jpg&f=1&nofb=1&ipt=b2d92f320b660f4bcca5c2fe6b7d4a6c8976cfaeff3d5e829fd07e298d59e49b&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!




bin_type = BinType.new(name: "household bins", description: "Bin for residual waste that cannot be recycled, encompassing items like hygiene products and tissues, providing a disposal solution for non-recyclable household waste.")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tagesspiegel.de%2Fpotsdam%2Fpotsdam-mittelmark%2Fimages%2Fmull-in-der-potsdamer-innenstadt%2Falternates%2FBASE_21_9_W1000%2Fmuell-in-der-potsdamer-innenstadt.jpeg&f=1&nofb=1&ipt=e66c2bd62781b69bd264393a023f8510dcec18e5e125385cdee56e6fd08ee61e&ipo=images")
bin_type.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
bin_type.save!

# either enough to show all on map, or enough for one example during presentation
location1 = Location.new(name: "HU", address: 'Unter den Linden 6, 10117 Berlin')
location1.save!
location2 = Location.new(name: "Jewish Museum", address: 'Lindenstraße 9-14, 10969 Berlin')
location2.save!
location3 = Location.new(name: "Tempodrom", address: 'Möckernstrasse 10, 10963 Berlin')
location3.save!
location4 = Location.new(name: "WBH", address: 'Wilhelmstraße 140, 10963 Berlin')
location4.save!
location5 = Location.new(name: "Mall", address: 'Leipziger Pl. 12, 10117 Berlin')
location5.save!

# enough to fill index page / Dashboard.
waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "vacuum bag")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.staubsauger.net%2Fwp-content%2Fuploads%2Fstaubsaugerbeutel-original-no-name1.jpg&f=1&nofb=1&ipt=9d977aaa194f9abcb31eddd59679ac691e08031b9184a607e61e35268653565e&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!

waste_item = WasteItem.new(user: user, bin_type: bin_type, name: "ashtray")
file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fde.academic.ru%2Fpictures%2Fdewiki%2F70%2FFull_Ashtray.jpg&f=1&nofb=1&ipt=bb26fa305a08249aace738cf86be95d0ff204b30406ab1945cfa5c37edc3c154&ipo=images")
waste_item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
waste_item.save!
