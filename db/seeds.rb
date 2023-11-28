# db/seeds.rb

# Clear existing data
DisposalRecord.destroy_all
LocationBinType.destroy_all
BinType.destroy_all
User.destroy_all
Category.destroy_all
WasteItem.destroy_all
Location.destroy_all

# Create users
user1 = User.create(username: 'user1', email: 'user1@example.com', password: 'password1')
user2 = User.create(username: 'user2', email: 'user2@example.com', password: 'password2')

# Create bin types
yellow_bin = BinType.create(name: 'Yellow Bin', description: 'Recyclable items')
organic_bin = BinType.create(name: 'Organic Waste Bin', description: 'Fruit/vegetable leftovers, peelings, including citrus, Coffee grounds, filters, tea, teabags, eggshells, Green cuttings/trimmings, leaves, flowers')
blue_paper_bin = BinType.create(name: 'Blue Paper Bin', description: 'Paper and cardboard packaging, newspapers, magazines, catalogs, catalogs, telephone books, brochures, writing and printing paper, cardboard, Paper bags (without plastic layer), Envelopes (without plastic layer)')
brown_bin = BinType.create(name: 'Brown Bin', description: 'Biodegradable kitchen and garden waste, fruit and vegetable waste, coffee grounds, eggshells, small amounts of meat and fish')
yellow_bag = BinType.create(name: 'Yellow Bag', description: 'Lightweight packaging made of plastic, metal, or composite materials, such as beverage cartons, yogurt pots, and plastic packaging')
gray_bin = BinType.create(name: 'Gray Bin', description: 'Residual waste that cannot be recycled')

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


# Create 20 waste items
20.times do |index|
  user = index.even? ? user1 : user2
  bin_type = case index % 6
             when 0 then yellow_bin
             when 1 then organic_bin
             when 2 then blue_paper_bin
             when 3 then brown_bin
             when 4 then yellow_bag
             else gray_bin
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

puts "Creating locations"
locations = [
  { name: 'Entsorgo', address: 'Schillerpromenade 39. 12049 Berlin'},
  { name: 'BSR', address: 'Asgardstraße 3. 13089 Berlin'},
  { name: 'DM', address: 'Friedrichstraße 191. 10117 Berlin'},
  { name: 'Waste not', address: 'Katzbachstraße 5. 10965 Berlin'},
  # Add more locations as needed
]

locations.each do |location|
 Location.create!(location)
end
puts 'Finished!'


###########################################


puts "Creating locations and bin types"

locations_bin_types = [
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: yellow_bin},
  {location: Location.all.sample, bin_type: blue_paper_bin},
  {location: Location.all.sample, bin_type: blue_paper_bin},
  {location: Location.all.sample, bin_type: brown_bin},
  {location: Location.all.sample, bin_type: brown_bin},
  {location: Location.all.sample, bin_type: brown_bin}
  # Add more locations as needed
]

locations_bin_types.each do |bin_type|
  LocationBinType.create!(bin_type)
end

puts 'Finished!'
