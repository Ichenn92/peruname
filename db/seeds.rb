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
zoom = { name: "Zoom" }
slack = { name: "Slack" }
skype = { name: "Skype" }
caffe_spettacolo = { name: "Caffè Spettacolo", address: "Place de la Gare 3, 1001 Lausanne" }
cafe_de_la_plage = { name: "Café de La Plage - Grand Théâtre de Genève", address: "Place de Neuve 5, 1204 Genève" }
etoile = { name: "L'Etoile", address: "Quai Jean-Pascal Delamuraz 1, 1006 Lausanne" }
montriond = { name: "Le Montriond", address: "Avenue Édouard Dapples 25, 1006 Lausanne" }
petit_theatre = { name: "Le Petit Théâtre", address: "Place de la Cathédrale 12, 1005 Lausanne" }
terrasse_des_grandes_roches = { name: "Terrasse des Grandes Roches", address: "Escaliers des Grandes-Roches, 1003 Lausanne" }
freddy_mercury_statue = { name: "Freddie Mercury Statue", address: "Place du Marché, 1820 Montreux" }
[zoom, slack, skype, caffe_spettacolo, cafe_de_la_plage, etoile, montriond, petit_theatre, terrasse_des_grandes_roches, freddy_mercury_statue].each do |attribute|
  location = Location.create!(attribute)
  puts "Setting a marker for #{location.name}"
end

puts "Sorting characters by category..."
anime = { name: "Anime" }
fake_friend = { name: "Fake friend" }
profession = { name: "Profession" }
celebrity = { name: "Celebrity" }
superhero = { name: "Superhero" }
others = { name: "Others" }
[anime, fake_friend, profession, celebrity, superhero, others].each do |attribute|
  character_category = CharacterCategory.create!(attribute)
  puts "Adding a new character category for #{character_category.name}"
end

puts "Imagining some characters..."
pikachu = { name: "Pikachu", character_category: CharacterCategory.find_by_name("Anime") }
puts pikachu
totoro = { name: "Totoro", character_category: CharacterCategory.find_by_name("Anime") }
candy = { name: "Candy", character_category: CharacterCategory.find_by_name("Anime") }
jiren = { name: "Jiren", character_category: CharacterCategory.find_by_name("Anime") }
soeur_emmanuelle = { name: "Soeur Emmanuelle", character_category: CharacterCategory.find_by_name("Celebrity") }
donald_trump = { name: "Donald Trump", character_category: CharacterCategory.find_by_name("Celebrity") }
chuck_norris = { name: "Chuck Norris", character_category: CharacterCategory.find_by_name("Celebrity") }
elon_musk = { name: "Elon Musk", character_category: CharacterCategory.find_by_name("Celebrity") }
beyonce = { name: "Beyonce", character_category: CharacterCategory.find_by_name("Celebrity") }
greta_thunberg = { name: "Greta Thunberg", character_category: CharacterCategory.find_by_name("Celebrity") }
iron_man = { name: "Iron Man", character_category: CharacterCategory.find_by_name("Superhero") }
thor = { name: "Thor", character_category: CharacterCategory.find_by_name("Superhero") }
wonder_woman = { name: "Wonder Woman", character_category: CharacterCategory.find_by_name("Superhero") }
batman = { name: "Batman", character_category: CharacterCategory.find_by_name("Superhero") }
teacher = { name: "Teacher", character_category: CharacterCategory.find_by_name("Profession") }
car_repairman = { name: "Car repairman", character_category: CharacterCategory.find_by_name("Profession") }
taxidermist = { name: "Taxidermist", character_category: CharacterCategory.find_by_name("Profession") }
web_developer = { name: "Web Developer", character_category: CharacterCategory.find_by_name("Profession") }
brandon = { name: "Brandon", character_category: CharacterCategory.find_by_name("Fake friend") }
julia = { name: "Julia", character_category: CharacterCategory.find_by_name("Fake friend") }
michel = { name: "Michel", character_category: CharacterCategory.find_by_name("Fake friend") }
blandine = { name: "Blandine", character_category: CharacterCategory.find_by_name("Fake friend") }
[pikachu, totoro, candy, jiren, soeur_emmanuelle, donald_trump, chuck_norris, elon_musk, beyonce, greta_thunberg, iron_man, wonder_woman, batman, teacher, car_repairman, taxidermist, web_developer, brandon, julia, michel, blandine].each do |attribute|
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
eytan = { nickname: "Tannenbaum", first_name: "Eytan", last_name: "Bergstein", email: "eytan.bergstein@gmail.com", password: "123456", actor: true, availability_start_time: Tod::TimeOfDay.new(15), availability_end_time: Tod::TimeOfDay.new(23) }
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
    io: URI.open("https://kitt.lewagon.com/placeholder/users/clem13-coder"),
    filename: "eytan.png",
    content_type: "image/png",
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
                  location: Location.find_by_name("Caffè Spettacolo") }
performance_5 = { description: "Everyone knows about Elon Musk, but only a few have had a chance to speak with him. He's actually a very fragile guy with a little success when smartphone cameras are not shooting. Poor boy.",
                  price_per_hour: 31,
                  character: Character.find_by_name("Elon Musk"),
                  user: User.find_by_nickname("Alibaba"),
                  performance_category: PerformanceCategory.find_by_name("Depressive"),
                  location: Location.find_by_name("Café de La Plage - Grand Théâtre de Genève") }
performance_6 = { description: "My brothers and sisters, my friends, let me give you a hand with something. I can't help it. Imagine a nun who gets so annoying because she can't help saying the good and helping out. Despicable but fun!",
                  price_per_hour: 36,
                  character: Character.find_by_name("Soeur Emmanuelle"),
                  user: User.find_by_nickname("Gibella"),
                  performance_category: PerformanceCategory.find_by_name("Parody"),
                  location: Location.find_by_name("Freddie Mercury Statue") }
performance_7 = { description: "We all remember our teachers in extreme ways, either very negative or very positive. But do you know any real teacher? A simple interpretation of a teacher with exagerration true to himself, but as stereotyped as shall be.",
                  price_per_hour: 24,
                  character: Character.find_by_name("Teacher"),
                  user: User.find_by_nickname("Canelloni"),
                  performance_category: PerformanceCategory.find_by_name("Realistic"),
                  location: Location.find_by_name("Le Petit Théâtre") }
performance_8 = { description: "This is a rare performance which you will never see in nature: a web developer trying to get romantic is like a wild cat trying to be polite, you don't get both in one animal.",
                  price_per_hour: 35,
                  character: Character.find_by_name("Web Developer"),
                  user: User.find_by_nickname("El Capo"),
                  performance_category: PerformanceCategory.find_by_name("Romantic"),
                  location: Location.find_by_name("Caffè Spettacolo") }
performance_9 = { description: "If you're fund of animal chasing and mangas, you know how to catch them all, except this is only chance to catch this one during a special date.",
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
                   location: Location.find_by_name("Freddie Mercury Statue") }
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
]

[performance_1, performance_2, performance_3, performance_4, performance_5, performance_6, performance_7, performance_8, performance_9, performance_10].each_with_index do |attribute, index|
  performance = Performance.create!(attribute)

  performance.photos.attach(io: photos[index][:io], filename: photos[index][:filename], content_type: photos[index][:content_type])

  puts "Assisting to a new #{performance.performance_category.name.downcase} performance of #{performance.character.name} interpreted by #{performance.user.nickname} at #{performance.location.name} "
end

until Booking.count > 20
  booking = Booking.new(
    date: Date.new(2021, rand(1..12), rand(1..28)),
    start_time: Tod::TimeOfDay.new(rand(8..12)),
    end_time: Tod::TimeOfDay.new(rand(13..17)),
    client_id: rand(1..5),
    performance: Performance.find(rand(1..10)),
    status: rand(0..2),
  )
  booking.actor_id = booking.performance.user.id
  booking.save
end

puts "Ready to enjoy the show!"
