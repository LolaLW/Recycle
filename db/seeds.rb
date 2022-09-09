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
require "yaml"
require "nokogiri"

Element.destroy_all
Category.destroy_all
Waste.destroy_all
Pickup.destroy_all
Dumpster.destroy_all

barcodes = %w[59032823
  3046920022651
  3225350000501
  3155251205296
  5411188119098
  3274080005003
  3046920022606
  8000500310427
  3760020507350
  5449000131805
  5410041005707]

puts "Barcodes done"

# category = Category.create(:name)
categories = ["Bac jaune", "Bac bleu", "Bac vert", "Bac marron", "Bac blanc"]

categories.each do |category|
  Category.create(name: category)
end

puts "Categories done"

["brique", "carton", "plastique", "métal", "papier", "verre", "verdure"].each do |el|
  element = Element.new(name: el)
  if el == "brique" || el == "carton" || el == "plastique" || el == "métal"
    element.category = Category.find_by_name('Bac jaune')
  elsif el == "papier"
    element.category = Category.find_by_name('Bac bleu')
  elsif el == "verre"
    element.category = Category.find_by_name('Bac blanc')
  elsif el == "alimentaire"
    element.category = Category.find_by_name('Bac marron')
  else
    element.category = Category.find_by_name('Bac vert')
  end
  element.save!
end

identifiants = Element.pluck(:name)

puts "Elements done"

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

puts "Waste done"
p Waste.all.count

# -

# create 20 pickups with name: 'Paris_01', etc.. and description from scrapping paris.fr

def define_post_code(code)
  if code < 10
    "7500" + code.to_s
  else
    "750" + code.to_s
  end
end

url = "https://www.paris.fr/pages/la-collecte-44#arrondissement-1-jt30l"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

description = []

(1..20).each do |code|
  result = html_doc.search("#arrondissement-#{code}-jt30l")
  description = result.search(".text").to_html.to_s
  Pickup.create(name: define_post_code(code), description: description)
end

# je scrappe
# string relative à l'id -> je stocke dans une variable -> je clean
# &
# je créé un object Pickup (le name doit être reconnaissable pour le faire matcher avec le postal_code)
# Pickup.create(name: , description: string)

puts "Pickup done"

# -

colonnes_a_verre_url = "https://opendata.paris.fr/api/records/1.0/search/?dataset=dechets-menagers-points-dapport-volontaire-colonnes-a-verre&q=&facet=type_colonne&facet=code_postal&facet=etat&facet=flux/records?limit=10"

colonnes_a_verre_json_file = JSON.parse(RestClient.get(colonnes_a_verre_url))

colonnes_a_verre_json_file.dig("records").each do |record|
  name = record.dig("datasetid")
  address = record.dig("fields", "adresse")
  coordinates = record.dig("geometry", "coordinates")

  Dumpster.create!(name: name,
                   address: address,
                   latitude: coordinates[1],
                   longitude: coordinates[0]
                  )

  puts "Dumpster done"
end

p Dumpster.all






# latitude: ,
# longitude:
