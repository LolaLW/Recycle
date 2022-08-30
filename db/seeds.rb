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
Element.destroy_all
Category.destroy_all

barcodes = %w(59032823
  3274080005003
  7622210449283
  5449000000996
  3168930010265
  8001505005592
  3046920022606
  8000500310427
  3760020507350
  5449000131805)

identifiants = Element.pluck(:name)
category = Category.create(:name)


identifiants.each do |identifiant|
  Element.create(name: identifiant, category: category)
end


barcodes.each do |barcode|
  url = "https://world.openfoodfacts.org/api/v0/product/#{barcode}.json"


  json_file = JSON.parse(RestClient.get(url))


  # remplacer les name, barcode et description par les valeurs du json_file

  name = json_file.dig('product', 'product_name')
  description = json_file.dig('product', 'packaging_text_fr')

  waste = Waste.create(name: name,
                       barcode: barcode,
                       description: description)

  # isoler à recycler
  # isoler les éléments à jeter
  values = identifiants.select { |el| description.upcase.include?(el.upcase) }
  values.each do |value|
    element = Element.find_by(name: value)
    ElementWaste.create(element: element, waste: waste)
  end
end


# element_ids.take(10).each do |id|
#   new_element = JSON.parse(RestClient.get(info_url(id)))
#   element = Element.new(
#     name: new_element["url"],
#   )
#   element.save
#   puts "[#{element.name}]"
# end
