# Clear existing data
DisposalRecord.destroy_all
LocationBinType.destroy_all
BinType.destroy_all
User.destroy_all
Category.destroy_all
WasteItem.destroy_all
Location.destroy_all

# Create users
alex = User.create(username: 'alex', email: 'alex@test.com', password: '123456')
emma = User.create(username: 'emma', email: 'emma@test.com', password: '123456')
shubam = User.create(username: 'shubam', email: 'shubam@test.com', password: '123456')
tony = User.create(username: 'tony', email: 'tony@test.com', password: '123456')
olli = User.create(username: 'olli', email: 'olli@test.com', password: '123456')
adam = User.create(username: 'adam', email: 'adam@test.com', password: '123456')

# Create bin types
yellow_bin = BinType.create(
  name: 'Recycling',
  description: 'Container for recyclable items, such as plastic, glass, and metal containers, promoting environmentally friendly waste disposal.'
)

organic_bin = BinType.create(
  name: 'Organic Waste',
  description: 'Bin designated for organic waste, including fruit/vegetable leftovers, peelings, coffee grounds, tea, eggshells, and green cuttings, fostering composting practices.'
)

blue_paper_bin = BinType.create(
  name: 'Paper',
  description: 'Container for paper and cardboard items, encompassing packaging, newspapers, magazines, catalogs, writing/printing paper, and cardboard, supporting paper recycling efforts.'
)

glass_bin = BinType.create(
  name: 'Glass',
  description: 'Dedicated bin for glass items, including jars, bottles, and any other glass materials, facilitating the recycling process for glass products.'
)

household_bin = BinType.create(
  name: 'Household Waste',
  description: 'Bin for residual waste that cannot be recycled, encompassing items like hygiene products and tissues, providing a disposal solution for non-recyclable household waste.'
)

bulky_bin = BinType.create(
  name: 'Bulky Waste',
  description: 'Bin designed for bulky residual waste that cannot be recycled, such as carpets, timber, and electrical devices, ensuring proper disposal of larger non-recyclable items.'
)

# Create categories
categories_data = [
  { name: 'Plastic', description: 'Recyclable items', credits: 5 },
  { name: 'Organic Waste', description: 'Fruit/vegetable leftovers, peelings, including citrus, Coffee grounds, filters, tea, teabags, eggshells, Green cuttings/trimmings, leaves, flowers', credits: 10 },
  { name: 'Paper', description: 'Paper and cardboard packaging, newspapers, magazines, catalogs, catalogs, telephone books, brochures, writing and printing paper, cardboard, Paper bags (without plastic layer), Envelopes (without plastic layer)', credits: 7 },
  { name: 'Compost', description: 'Biodegradable kitchen and garden waste, fruit and vegetable waste, coffee grounds, eggshells, small amounts of meat and fish', credits: 8 },
  { name: 'Packging', description: 'Lightweight packaging made of plastic, metal, or composite materials, such as beverage cartons, yogurt pots, and plastic packaging', credits: 6 },
  { name: 'General waste', description: 'Residual waste that cannot be recycled', credits: 3 }
]

categories_data.each do |category|
  Category.create(category)
end

puts "Creating locations"
locations = [
  { name: 'Entsorgo', address: 'Schillerpromenade 39. 12049 Berlin'},
  { name: 'BSR', address: 'Asgardstraße 3. 13089 Berlin'},
  { name: 'DM', address: 'Friedrichstraße 191. 10117 Berlin'},
  { name: 'Waste not', address: 'Katzbachstraße 5. 10965 Berlin'},
]

locations.each do |location|
  Location.create!(location)
end

puts "Creating locations and bin types"

locations_bin_types = [
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: blue_paper_bin},
  {location: Location.all.sample, bin_type: blue_paper_bin},
  {location: Location.all.sample, bin_type: organic_bin},
  {location: Location.all.sample, bin_type: organic_bin},
  {location: Location.all.sample, bin_type: organic_bin}
]

locations_bin_types.each do |bin_type|
  LocationBinType.create!(bin_type)
end

puts 'Finished with locations!'

# Create 20 waste items & disposal records
20.times do |index|
  user = index.even? ? alex : emma
  bin_type = case index % 6
            when 0 then yellow_bin
            when 1 then organic_bin
            when 2 then blue_paper_bin
            when 3 then organic_bin
            when 4 then glass_bin
            else household_bin
            end

  category = Category.all.sample

  waste_item = WasteItem.create(
    user: user,
    bin_type: bin_type,
    category: category,
    name: "Item #{index + 1}"
  )

  location = Location.first

  # Create disposable_records
  DisposalRecord.create(
    user: user,
    location: location,
    waste_item: waste_item,
    disposal_date: "date"
  )
end

puts 'Finished with all the seeds! 🗑️ 🗑️ 🗑️'
