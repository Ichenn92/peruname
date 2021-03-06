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
Booking.destroy_all

puts "Placing locations on the map..."
caffe_spettacolo = { name: "Caffè Spettacolo", address: "Place de la Gare 3, 1001 Lausanne" }
etoile = { name: "L'Etoile", address: "Quai Jean-Pascal Delamuraz 1, 1006 Lausanne" }
montriond = { name: "Le Montriond", address: "Avenue Édouard Dapples 25, 1006 Lausanne" }
petit_theatre = { name: "Le Petit Théâtre", address: "Place de la Cathédrale 12, 1005 Lausanne" }
terrasse_des_grandes_roches = { name: "Terrasse des Grandes Roches", address: "Escaliers des Grandes-Roches, 1003 Lausanne" }
theatre_des_lutins = { name: "Théâtre des Lutins", address: "Rue du Petit-Saint-Jean 1A, 1003 Lausanne" }
theatre_du_vide_poche = { name: "Théâtre du Vide-Poche", address: "Place de la Palud 10, 1003 Lausanne" }
restaurant_du_theatre = { name: "Restaurant du Théâtre", address: "Avenue du Théâtre 12, 1005 Lausanne" }
theatre_2_21 = { name: "Théâtre 2.21", address: "Rue de l'Industrie 10, 1005 Lausanne" }
cafe_restaurant_le_valentin = { name: "Café Restaurant Le Valentin", address: "Rue du Valentin 30, 1004 Lausanne" }
culture_cafe = { name: "Culture Café", address: "Rue de Genève 6, 1003 Lausanne" }
cafe_des_artisans = { name: "Café des Artisans", address: "Rue Centrale 16, 1003 Lausanne" }
the_coffee_project = { name: "The Coffee Project", address: "Rue Marterey 1-3, 1005 Lausanne" }
cafe_la_couronne_d_or = { name: "Café La Couronne d'Or", address: "Rue des Deux-Marchés 13, 1005 Lausanne" }
coccinelle_cafe = { name: "Coccinelle Café", address: "Rue Pichard 18, 1003 Lausanne" }
cafe_restaurant_mozart = { name: "Café Restaurant Mozart", address: "Rue de la Grotte 2, 1003 Lausanne" }
cafe_des_avenues = { name: "Café des Avenues", address: "Avenue de Jurigoz, Avenue de Montchoisi 20, 1006 Lausanne" }
cafe_de_grancy = { name: "Café de Grancy", address: "Avenue du Rond-Point 1, 1006 Lausanne" }

[ caffe_spettacolo, 
  etoile, 
  montriond, 
  petit_theatre, 
  terrasse_des_grandes_roches, 
  theatre_des_lutins, 
  theatre_du_vide_poche,
  restaurant_du_theatre,
  theatre_2_21,
  cafe_restaurant_le_valentin,
  culture_cafe,
  cafe_des_artisans,
  the_coffee_project,
  cafe_la_couronne_d_or,
  coccinelle_cafe,
  cafe_restaurant_mozart,
  cafe_des_avenues,
  cafe_de_grancy ].each do |attribute|
  location = Location.create!(attribute)
  puts "Setting a marker for #{location.name}"
end

puts "Sorting characters by category..."
anime = { name: "Anime" }
fake_friend = { name: "Fake friend" }
profession = { name: "Profession" }
celebrity = { name: "Celebrity" }
superhero = { name: "Superhero" }
fiction = { name: "Fiction" }
old_fashioned = { name: "Old fashioned"}
others = { name: "Others" }
[ anime, 
  fake_friend, 
  profession, 
  celebrity, 
  superhero, 
  fiction, 
  old_fashioned, 
  others ].each do |attribute|
  character_category = CharacterCategory.create!(attribute)
  puts "Adding a new character category for #{character_category.name}"
end

puts "Imagining some characters..."
pikachu = { name: "Pikachu", character_category: CharacterCategory.find_by_name("Anime") }
totoro = { name: "Totoro", character_category: CharacterCategory.find_by_name("Anime") }
candy = { name: "Candy", character_category: CharacterCategory.find_by_name("Anime") }
jiren = { name: "Jiren", character_category: CharacterCategory.find_by_name("Anime") }
soeur_emmanuelle = { name: "Soeur Emmanuelle", character_category: CharacterCategory.find_by_name("Celebrity") }
donald_trump = { name: "Donald Trump", character_category: CharacterCategory.find_by_name("Celebrity") }
chuck_norris = { name: "Chuck Norris", character_category: CharacterCategory.find_by_name("Celebrity") }
elon_musk = { name: "Elon Musk", character_category: CharacterCategory.find_by_name("Celebrity") }
beyonce = { name: "Beyonce", character_category: CharacterCategory.find_by_name("Celebrity") }
greta_thunberg = { name: "Greta Thunberg", character_category: CharacterCategory.find_by_name("Celebrity") }
marylin_monroe = { name: "Marylin Monroe", character_category: CharacterCategory.find_by_name("Celebrity") }
marylin_manson = { name: "Marylin Manson", character_category: CharacterCategory.find_by_name("Celebrity") }
iron_man = { name: "Iron Man", character_category: CharacterCategory.find_by_name("Superhero") }
thor = { name: "Thor", character_category: CharacterCategory.find_by_name("Superhero") }
wonder_woman = { name: "Wonder Woman", character_category: CharacterCategory.find_by_name("Superhero") }
batman = { name: "Batman", character_category: CharacterCategory.find_by_name("Superhero") }
hulk = { name: "Hulk", character_category: CharacterCategory.find_by_name("Superhero") }
captain_america = { name: "Captain America", character_category: CharacterCategory.find_by_name("Superhero") }
teacher = { name: "Teacher", character_category: CharacterCategory.find_by_name("Profession") }
car_repairman = { name: "Car repairman", character_category: CharacterCategory.find_by_name("Profession") }
taxidermist = { name: "Taxidermist", character_category: CharacterCategory.find_by_name("Profession") }
web_developer = { name: "Web developer", character_category: CharacterCategory.find_by_name("Profession") }
president_of_the_united_states = { name: "President of the United States", character_category: CharacterCategory.find_by_name("Profession") }
reporter = { name: "Reporter", character_category: CharacterCategory.find_by_name("Profession") }
pediatric_heart_surgeon = { name: "Pediatric heart surgeon", character_category: CharacterCategory.find_by_name("Profession") }
chief_executive_officer = { name: "Chief executive officer", character_category: CharacterCategory.find_by_name("Profession") }
brandon = { name: "Brandon", character_category: CharacterCategory.find_by_name("Fake friend") }
julia = { name: "Julia", character_category: CharacterCategory.find_by_name("Fake friend") }
michel = { name: "Michel", character_category: CharacterCategory.find_by_name("Fake friend") }
blandine = { name: "Blandine", character_category: CharacterCategory.find_by_name("Fake friend") }
thomas = { name: "Thomas", character_category: CharacterCategory.find_by_name("Fake friend") }
emma = { name: "Emma", character_category: CharacterCategory.find_by_name("Fake friend") }
dr_who = { name: "Dr Who", character_category: CharacterCategory.find_by_name("Fiction") }
darth_vador = { name: "Darth Vador", character_category: CharacterCategory.find_by_name("Fiction") }
harry_potter = { name: "Harry Potter", character_category: CharacterCategory.find_by_name("Fiction") }
the_wizard_of_oz = { name: "The Wizard of Oz", character_category: CharacterCategory.find_by_name("Fiction") }
jon_snow = { name: "Jon Snow", character_category: CharacterCategory.find_by_name("Fiction") }
louis_xiv = { name: "Louis XIV", character_category: CharacterCategory.find_by_name("Old fashioned") }
staline = { name: "Staline", character_category: CharacterCategory.find_by_name("Old fashioned") }
abraham_lincoln = { name: "Abraham Lincoln", character_category: CharacterCategory.find_by_name("Old fashioned") }
mahatma_gandhi = { name: "Mahatma Gandhi", character_category: CharacterCategory.find_by_name("Old fashioned") }
d_artagnan = { name: "D'Artagnan", character_category: CharacterCategory.find_by_name("Old fashioned") }
napoleon = { name: "Napoleon", character_category: CharacterCategory.find_by_name("Old fashioned") }
william_tell = { name: "William Tell", character_category: CharacterCategory.find_by_name("Old fashioned") }
[ pikachu, 
  totoro, 
  candy, 
  jiren, 
  soeur_emmanuelle, 
  donald_trump, 
  chuck_norris, 
  elon_musk, 
  beyonce, 
  greta_thunberg,
  marylin_monroe, 
  marylin_manson,
  iron_man, 
  wonder_woman, 
  batman,
  hulk,
  captain_america,
  teacher, 
  car_repairman, 
  taxidermist, 
  web_developer,
  president_of_the_united_states,
  reporter,
  pediatric_heart_surgeon,
  chief_executive_officer,
  brandon, 
  julia, 
  michel, 
  blandine,
  thomas,
  emma,
  dr_who,
  darth_vador,
  harry_potter,
  the_wizard_of_oz,
  jon_snow,
  louis_xiv,
  staline,
  abraham_lincoln,
  mahatma_gandhi,
  d_artagnan,
  napoleon,
  william_tell ].each do |attribute|
  character = Character.create!(attribute)
  puts "Spawning a new character called #{character.name}"
end

puts "Sorting performances by category..."
romantic = { name: "Romantic" }
funny = { name: "Funny" }
depressive = { name: "Depressive" }
realistic = { name: "Realistic" }
parody = { name: "Parody" }
miscellaneous = { name: "Miscellaneous" }
[romantic, funny, depressive, realistic, parody, miscellaneous].each do |attribute|
  performance_category = PerformanceCategory.create!(attribute)
  puts "Adding a new performance category for #{performance_category.name}"
end

puts "Registering a few user..."
alain = { nickname: "Alibaba", first_name: "Alain", last_name: "Berclaz", email: "alain.berclaz@gmail.com", password: "123456", actor: true, availability_start_time: Tod::TimeOfDay.new(10), availability_end_time: Tod::TimeOfDay.new(19) }
giselle = { nickname: "Gibella", first_name: "Giselle", last_name: "Schmidt", email: "giselle.schmidt@gmail.com", password: "123456", actor: true, availability_start_time: Tod::TimeOfDay.new(8), availability_end_time: Tod::TimeOfDay.new(16) }
eytan = { nickname: "Tannenbaum", first_name: "Eytan", last_name: "Bergstein", email: "eytan.bergstein@gmail.com", password: "123456", actor: false, availability_start_time: Tod::TimeOfDay.new(15), availability_end_time: Tod::TimeOfDay.new(23) }
canelle = { nickname: "Canelloni", first_name: "Caroline", last_name: "Maupas", email: "caroline.maupas@gmail.com", password: "123456", actor: true, availability_start_time: Tod::TimeOfDay.new(11), availability_end_time: Tod::TimeOfDay.new(22) }
gontrand = { nickname: "El Capo", first_name: "Gaston", last_name: "Capo", email: "gaston.capo@gmail.com", password: "123456", actor: true, availability_start_time: Tod::TimeOfDay.new(9), availability_end_time: Tod::TimeOfDay.new(20) }

photos = [
  {
    io: URI.open("https://kitt.lewagon.com/placeholder/users/michaellaurac"),
    filename: "alain.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://kitt.lewagon.com/placeholder/users/Ichenn92"),
    filename: "giselle.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.pexels.com/photos/5191436/pexels-photo-5191436.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
    filename: "eytan.jpg",
    content_type: "image/jpg",
  },
  {
    io: URI.open("https://upload.wikimedia.org/wikipedia/commons/6/62/Thomas_Wiesel.png"),
    filename: "canelle.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://agenda.culturevalais.ch/uploads/thumbs_default/76/7629c29157f6c6213455a23d26f88dbc.jpg"),
    filename: "gontrand.png",
    content_type: "image/png",
  },
]

[alain, giselle, eytan, canelle, gontrand].each_with_index do |attribute, index|
  user = User.create!(attribute)

  user.photo.attach(io: photos[index][:io], filename: photos[index][:filename], content_type: photos[index][:content_type])

  puts "Signing up a new user nicknamed #{user.nickname}: #{user.first_name} #{user.last_name}"
end

puts "Rehearsing some performances..."
performance_1 = { description: "The Brandon you will meet is the typical character you might cross on Santa Monica Boulevard, looks like a fiction but real.",
                  price_per_hour: 15,
                  character: Character.find_by_name("Brandon"),
                  user: User.find_by_nickname("Alibaba"),
                  performance_category: PerformanceCategory.find_by_name("Romantic"),
                  location: Location.find_by_name("Le Montriond") }
performance_2 = { description: "Are you looking for an unusual and rare date? Have you ever thought of dinning with the person who might very well have stuffed a family member of the quarry animal you are having for dinner.",
                  price_per_hour: 51,
                  character: Character.find_by_name("Taxidermist"),
                  user: User.find_by_nickname("Gibella"),
                  performance_category: PerformanceCategory.find_by_name("Romantic"),
                  location: Location.find_by_name("Caffè Spettacolo") }
performance_3 = { description: "If Julia was real you would probably would like to ask her to marry. She's typically normal, good looking, nodding now and then and looking interested at what your are saying. Or she could just be a good friend. Or both.",
                  price_per_hour: 21,
                  character: Character.find_by_name("Julia"),
                  user: User.find_by_nickname("Canelloni"),
                  performance_category: PerformanceCategory.find_by_name("Romantic"),
                  location: Location.find_by_name("Le Petit Théâtre") }
performance_4 = { description: "If you have ever heard of Chuck Norris, you will know what you will have the chance to meet. Someone truly and fantastically phenomenal, capable or everything and its exact contrary, a supernatural force of nature with sense of self-esteem.",
                  price_per_hour: 47,
                  character: Character.find_by_name("Chuck Norris"),
                  user: User.find_by_nickname("El Capo"),
                  performance_category: PerformanceCategory.find_by_name("Funny"),
                  location: Location.find_by_name("Café Restaurant Le Valentin") }
performance_5 = { description: "Everyone knows about Elon Musk, but only a few have had a chance to speak with him. He's actually a very fragile guy with a little success when smartphone cameras are not shooting. Poor boy.",
                  price_per_hour: 31,
                  character: Character.find_by_name("Elon Musk"),
                  user: User.find_by_nickname("Alibaba"),
                  performance_category: PerformanceCategory.find_by_name("Depressive"),
                  location: Location.find_by_name("Café Restaurant Mozart") }
performance_6 = { description: "My brothers and sisters, my friends, let me give you a hand with something. I can't help it. Imagine a nun who gets so annoying because she can't help saying the good and helping out. Despicable but fun!",
                  price_per_hour: 36,
                  character: Character.find_by_name("Soeur Emmanuelle"),
                  user: User.find_by_nickname("Gibella"),
                  performance_category: PerformanceCategory.find_by_name("Parody"),
                  location: Location.find_by_name("Culture Café") }
performance_7 = { description: "We all remember our teachers in extreme ways, either very negative or very positive. But do you know any real teacher? A simple interpretation of a teacher with exagerration true to himself, but as stereotyped as shall be.",
                  price_per_hour: 24,
                  character: Character.find_by_name("Teacher"),
                  user: User.find_by_nickname("Canelloni"),
                  performance_category: PerformanceCategory.find_by_name("Realistic"),
                  location: Location.find_by_name("The Coffee Project") }
performance_8 = { description: "This is a rare performance which you will never see in nature: a web developer trying to get romantic is like a wild cat trying to be polite, you don't get both in one animal.",
                  price_per_hour: 35,
                  character: Character.find_by_name("Web developer"),
                  user: User.find_by_nickname("El Capo"),
                  performance_category: PerformanceCategory.find_by_name("Romantic"),
                  location: Location.find_by_name("Théâtre du Vide-Poche") }
performance_9 = { description: "If you're fond of animal chasing and mangas, you know how to catch them all, except this is only chance to catch this one during a special date.",
                  price_per_hour: 49,
                  character: Character.find_by_name("Pikachu"),
                  user: User.find_by_nickname("Alibaba"),
                  performance_category: PerformanceCategory.find_by_name("Parody"),
                  location: Location.find_by_name("Terrasse des Grandes Roches") }
performance_10 = { description: "All carried by her engagement and enthusiam of her great causes are not enough to cheer Greta and let her hope for a better future.",
                   price_per_hour: 46,
                   character: Character.find_by_name("Greta Thunberg"),
                   user: User.find_by_nickname("Gibella"),
                   performance_category: PerformanceCategory.find_by_name("Depressive"),
                  location: Location.find_by_name("L'Etoile") }
performance_11 = { description: "No one can better represent the pop culture than a Marylin Monroe, who wants to be loved by you.",
                   price_per_hour: 42,
                   character: Character.find_by_name("Marylin Monroe"),
                   user: User.find_by_nickname("Gibella"),
                   performance_category: PerformanceCategory.find_by_name("Romantic"),
                   location: Location.find_by_name("Café des Avenues") }
performance_12 = { description: "Beware the dark side of the force, as it might lead to intricated family stories",
                   price_per_hour: 33,
                   character: Character.find_by_name("Darth Vador"),
                   user: User.find_by_nickname("El Capo"),
                   performance_category: PerformanceCategory.find_by_name("Parody"),
                   location: Location.find_by_name("Café de Grancy") }
performance_13 = { description: "Have you ever dreamt of travelling space and time with an unsual time lord with two hearts?",
                   price_per_hour: 28,
                   character: Character.find_by_name("Dr Who"),
                   user: User.find_by_nickname("El Capo"),
                   performance_category: PerformanceCategory.find_by_name("Funny"),
                   location: Location.find_by_name("Théâtre 2.21") }
performance_14 = { description: "A hand on your chest, you will have the chance to revive the greatest emperor of the European history, after Julius",
                   price_per_hour: 24,
                   character: Character.find_by_name("Napoleon"),
                   user: User.find_by_nickname("Alibaba"),
                   performance_category: PerformanceCategory.find_by_name("Depressive"),
                   location: Location.find_by_name("Théâtre des Lutins") }
performance_15 = { description: "Your favorite teenager wizard, with his broomstick and glasses",
                   price_per_hour: 24,
                   character: Character.find_by_name("Harry Potter"),
                   user: User.find_by_nickname("Alibaba"),
                   performance_category: PerformanceCategory.find_by_name("Realistic"),
                   location: Location.find_by_name("Café La Couronne d'Or") }
photos = [
  {
    io: URI.open("https://images.unsplash.com/photo-1592525969064-afa927e72ccf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_1.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1520697227012-1a7f0fd6c5c1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    filename: "performance_2.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/uploads/14110635637836178f553/dcc2ccd9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_3.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1519200566043-99f14d08fcf9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_4.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1517976547714-720226b864c1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_5.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1541606927369-6a93c81d94e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"),
    filename: "performance_6.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1597570889212-97f48e632dad?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1355&q=80"),
    filename: "performance_7.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1573167130797-8453176c73d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_8.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1609372332255-611485350f25?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    filename: "performance_9.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1544994130-e784812e3f07?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    filename: "performance_10.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1611699066085-ba118c694596?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"),
    filename: "performance_11.png",
    content_type: "image/png",
  },
  {
    io: URI.open("https://pbs.twimg.com/profile_images/1346042465917218820/Dc2ZGKb8.jpg"),
    filename: "performance_12.jpg",
    content_type: "image/jpg",
  },
  {
    io: URI.open("https://cdn.pixabay.com/photo/2016/11/11/12/01/tardis-1816598_1280.jpg"),
    filename: "performance_13.jpg",
    content_type: "image/jpg",
  },
  {
    io: URI.open("https://images.pexels.com/photos/4204094/pexels-photo-4204094.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
    filename: "performance_14.jpg",
    content_type: "image/jpg",
  },
  {
    io: URI.open("https://images.unsplash.com/photo-1551269901-5c5e14c25df7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=3900&q=80"),
    filename: "performance_15.jpg",
    content_type: "image/jpg",
  },
]

[ performance_1, 
  performance_2, 
  performance_3, 
  performance_4, 
  performance_5, 
  performance_6, 
  performance_7, 
  performance_8, 
  performance_9, 
  performance_10,
  performance_11,
  performance_12,
  performance_13,
  performance_14,
  performance_15,
].each_with_index do |attribute, index|
  performance = Performance.create!(attribute)

  performance.photo.attach(io: photos[index][:io], filename: photos[index][:filename], content_type: photos[index][:content_type])

  puts "Assisting to a new #{performance.performance_category.name.downcase} performance of #{performance.character.name} interpreted by #{performance.user.nickname} at #{performance.location.name} "
end

until Booking.count > 30
  booking = Booking.new(
    date: Date.new(2021, rand(1..12), rand(1..28)),
    start_time: Tod::TimeOfDay.new(rand(8..12)),
    end_time: Tod::TimeOfDay.new(rand(13..17)),
    client_id: rand(1..5),
    performance: Performance.find(rand(1..15)),
    status: 0,
  )
  booking.actor_id = booking.performance.user.id
  booking.save
end

puts "Ready to enjoy the show!"
