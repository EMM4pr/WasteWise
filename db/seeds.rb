# db/seeds.rb

# Clear existing data
User.destroy_all
BinType.destroy_all
Category.destroy_all
WasteItem.destroy_all

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
  { name: 'Yellow Bin', description: 'Recyclable items', credits: 5 },
  { name: 'Organic Waste Bin', description: 'Fruit/vegetable leftovers, peelings, including citrus, Coffee grounds, filters, tea, teabags, eggshells, Green cuttings/trimmings, leaves, flowers', credits: 10 },
  { name: 'Blue Paper Bin', description: 'Paper and cardboard packaging, newspapers, magazines, catalogs, catalogs, telephone books, brochures, writing and printing paper, cardboard, Paper bags (without plastic layer), Envelopes (without plastic layer)', credits: 7 },
  { name: 'Brown Bin', description: 'Biodegradable kitchen and garden waste, fruit and vegetable waste, coffee grounds, eggshells, small amounts of meat and fish', credits: 8 },
  { name: 'Yellow Bag', description: 'Lightweight packaging made of plastic, metal, or composite materials, such as beverage cartons, yogurt pots, and plastic packaging', credits: 6 },
  { name: 'Gray Bin', description: 'Residual waste that cannot be recycled', credits: 3 }
]
Category.create(categories_data)

locations_data = [
  { name: 'Le Wagon', address: 'Rudi-Dutschke-Straße', latitude: '', longitude: ''}
]
Location.create(locations_data)

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

  category = Category.find_by(name: bin_type.name)

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

puts 'Seeds created successfully!'
