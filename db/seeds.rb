# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "rest-client"
require "open-uri"

Waste.destroy_all
puts "Waste destroyed"
Element.destroy_all
puts "Element destroyed"
Category.destroy_all
puts "Category destroyed"

barcodes = %w[59032823
  3274080005003
  7622210449283
  5449000000996
  3168930010265
  8001505005592
  3046920022606
  8000500310427
  3760020507350
  5449000131805]

puts "Barcodes done"

# category = Category.create(:name)
categories = ["Pbl Jaune", "Pbl Bleue"]

categories.each do |category|
  Category.create(name: category)
end

puts "Categories done"

# identifiants = Element.pluck(:name)
identifiants = ["Carton", "Papier", "Plastique"]

identifiants.each do |identifiant|
  Element.create(name: identifiant, category: Category.first)
  # A REVOIR ICI pour pas que tous les Elements soient associé à la premiere Category
end

p Category.all.count
p Element.all.count

barcodes.each do |barcode|
  url = "https://world.openfoodfacts.org/api/v0/product/#{barcode}.json"

  json_file = JSON.parse(RestClient.get(url))

  # remplacer les name, barcode et description par les valeurs du json_file

  name = json_file.dig('product', 'product_name')
  description = json_file.dig('product', 'packaging_text_fr')

  waste = Waste.create(name: name,
                       barcode: barcode,
                       description: description)

  values = identifiants.select { |el| description.upcase.include?(el.upcase) }
  p values
  values.each do |value|
    element = Element.find_by(name: value)
    ElementWaste.create(element: element, waste: waste)
  end
end

p Waste.all.count
