# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Performance.destroy_all
User.destroy_all
Location.destroy_all
PerformanceCategory.destroy_all
Character.destroy_all
CharacterCategory.destroy_all

puts "Placing locations on the map..."

zoom = { address: "Zoom" }
slack = { address: "Slack" }
skype = { address: "Skype" }
caffe_spettacolo = { name: "Caffè Spettacolo", address: "Place de la Gare 3, 1001 Lausanne" }
cafe_de_la_plage = { name: "Café de La Plage - Grand Théâtre de Genève", address: "Place de Neuve 5, 1204 Genève" }
etoile = { name: "L'Etoile", address: "Quai Jean-Pascal Delamuraz 1, 1006 Lausanne" }
montriond = { name: "Le Montriond", address: "Avenue Édouard Dapples 25, 1006 Lausanne" }
petit_theatre = { name: "Le Petit Théâtre", address: "Place de la Cathédrale 12, 1005 Lausanne" }
terrasse_des_grandes_roches = { name: "Terrasse des Grandes Roches", address: "Escaliers des Grandes-Roches, 1003 Lausanne" }
freddy_mercury_statue = { name: "Freddie Mercury Statue", address: "Place du Marché, 1820 Montreux" }

bloody_mary = { name: "Bloody Mary" }
sex_on_the_beach = { name: "Sex on the beach" }
margarita = { name: "Margarita" }
pina_colada = { name: "Piña colada" }
[ mojito, bloody_mary, sex_on_the_beach, margarita, pina_colada ].each do |attributes|
  cocktail = Cocktail.create!(attributes)
  puts "Writing receipe of the #{cocktail.name}"
end

puts "Sorting ingredients..."
mint = { name: "Mint" }
vodka = { name: "Vodka" }
rum = { name: "Rum" }
tequila = { name: "Tequila" }
orange_juice = { name: "Orange juice" }
tomato_juice = { name: "Tomato juice" }
[ mint, vodka, rum, tequila, orange_juice, tomato_juice ].each do |attributes|
  ingredient = Ingredient.create!(attributes)
  puts "Fetched some #{ingredient.name.downcase}"
end

puts "Mixing doses..."
dose_1 = { description: "6 leaves", cocktail: Cocktail.find_by_name("Mojito"), ingredient: Ingredient.find_by_name("Mint") }
dose_2 = { description: "1.5 oz", cocktail: Cocktail.find_by_name("Mojito"), ingredient: Ingredient.find_by_name("Rum") }
dose_3 = { description: "4.5 cl", cocktail: Cocktail.find_by_name("Bloody Mary"), ingredient: Ingredient.find_by_name("Vodka") }
dose_4 = { description: "9 cl", cocktail: Cocktail.find_by_name("Bloody Mary"), ingredient: Ingredient.find_by_name("Tomato juice") }
dose_5 = { description: "1.33 oz", cocktail: Cocktail.find_by_name("Sex on the beach"), ingredient: Ingredient.find_by_name("Vodka") }
dose_6 = { description: "1.33 oz", cocktail: Cocktail.find_by_name("Sex on the beach"), ingredient: Ingredient.find_by_name("Orange juice") }
dose_7 = { description: "2 cl", cocktail: Cocktail.find_by_name("Margarita"), ingredient: Ingredient.find_by_name("Tequila") }
[ dose_1, dose_2, dose_3, dose_4, dose_5, dose_6, dose_7 ].each do |attributes|
  dose = Dose.create!(attributes)
  puts "Pouring #{dose.description} of #{dose.ingredient.name.downcase} in the #{dose.cocktail.name}"
end

puts "Ready to enjoy the drinks!"