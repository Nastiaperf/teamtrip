puts "destroying all datas"
Vote.destroy_all
Suggestion.destroy_all
Day.destroy_all
TripMember.destroy_all
Trip.destroy_all
User.destroy_all
puts "All exisiting data destroyed"

def get_photo(name)
  url = Addressable::URI.parse("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{name}&inputtype=textquery&fields=formatted_address%2Cphoto%2Crating%2Copening_hours&key=#{ENV['GOOGLE_API_SERVER_KEY']}")
  response = HTTParty.get("https://maps.googleapis.com#{url.normalize.request_uri}")
  return photo = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{response['candidates'][0]['photos'][0]['photo_reference']}&sensor=false&maxheight=500&maxwidth=500&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
end

def get_opening_hours(name)
  url = Addressable::URI.parse("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{name}&inputtype=textquery&fields=formatted_address%2Cphoto%2Crating%2Copening_hours&key=#{ENV['GOOGLE_API_SERVER_KEY']}")
  response = HTTParty.get("https://maps.googleapis.com#{url.normalize.request_uri}")
  return opening_hours = response['candidates'][0]['opening_hours']
end

puts "creating users"
romain = User.create(
  photo: "https://kitt.lewagon.com/placeholder/users/romainp72",
  email: "romain@example.com",
  password: "secret",
  first_name: "romain",
  last_name: "duwagon"
  )

camille = User.create(
  photo: "https://kitt.lewagon.com/placeholder/users/camillemarti",
  email: "camille@example.com",
  password: "secret",
  first_name: "camille",
  last_name: "duwagon"
  )

anastasia = User.create(
  photo: "https://kitt.lewagon.com/placeholder/users/nastiaperf",
  email: "anastasia@example.com",
  password: "secret",
  first_name: "anastasia",
  last_name: "duwagon"
  )

vincent = User.create(
  photo: "https://kitt.lewagon.com/placeholder/users/vincentvignali",
  email: "vincent@example.com",
  password: "secret",
  first_name: "vincent",
  last_name: "duwagon"
  )

largo = User.create(
  photo: "https://t2.ea.ltmcdn.com/fr/razas/3/7/5/img_573_beagle_0_600.jpg",
  email: "largo@example.com",
  password: "secret",
  first_name: "largo",
  last_name: "duwagon"
  )

charly = User.create(
  photo: "https://www.thesprucepets.com/thmb/YQzfza2oKOCzQIvX-K66BRi1DjI=/1080x1080/filters:no_upscale():max_bytes(150000):strip_icc()/30078352_448703938920062_6275637137232625664_n-5b0de8c443a1030036f9e15e.jpg",
  email: "jojo@example.com",
  password: "secret",
  first_name: "Jojo",
  last_name: "duwagon"
  )

puts "users created"

puts "creating trip"

portugal_trip = Trip.create(
  name: "Portugal",
  start_date: '03/01/2022',
  end_date: '11/01/2022',
  location: "Portugal",
  creator_id: User.first.id # chelou
)
portugal_trip.save!

puts "trip created"

puts "-- Day range for the trip --"
puts portugal_trip.days.pluck(:date)
puts "-- Day range for the trip --"

puts "creating trip_members"

trip_member_2 = TripMember.create(
  user: User.all[1],
  trip: Trip.first
)

trip_member_3 = TripMember.create(
  user: User.all[2],
  trip: Trip.first
)

trip_member_4 = TripMember.create(
  user: User.all[3],
  trip: Trip.first
)

trip_member_5 = TripMember.create(
  user: User.all[4],
  trip: Trip.first
)

trip_member_6 = TripMember.create(
  user: User.all[5],
  trip: Trip.first
)

puts "trip_members created"

puts "creating suggestions"

suggestion_1 = Suggestion.create(
  category: "Hotel",
  name: "Golden Tulip Porto Gaia Hotel & SPA",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  price: 80,
  comment: "Super view on the beach and nice breakfast",
  photo: get_photo("Golden Tulip Porto Gaia Hotel & SPA"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Golden Tulip Porto Gaia Hotel & SPA").normalize}",
  location: "Praia de Lavadores, R. da Bélgica 86, 4400-044 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("Golden Tulip Porto Gaia Hotel & SPA"),
)

suggestion_2 = Suggestion.create(
  category: "Restaurant",
  name: "Sabores da Amazónia",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  price: 12.30,
  comment: "Close to hotel, super rating on G Maps",
  photo: get_photo("Sabores da Amazónia"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Sabores da Amazónia").normalize}",
  location: "R. de Dom Manuel II 270, 4050-378 Porto, Portugal",
  opening_hours: get_opening_hours("Sabores da Amazónia porto"),
)

suggestion_3 = Suggestion.create(
  category: "Restaurant",
  name: "Meia-Nau Porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users[5],
  price: 40,
  comment: "The food is amazing and the prices very decent",
  photo: get_photo("Meia-Nau Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Meia-Nau Porto").normalize}",
  location: "Tv. de Cedofeita 48, 4050-183 Porto, Portugal",
  opening_hours: get_opening_hours("Meia-Nau Porto"),
)

suggestion_4 = Suggestion.create(
  category: "Activity",
  name: "Praia de salgueiro, porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.third,
  comment: "very crowded and has big waves!",
  photo: get_photo("Praia de salgueiro, porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Praia de salgueiro, porto").normalize}",
  location: "Av. da Beira-Mar C2, 4400-572 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("Praia de salgueiro, porto"),
)

suggestion_5 = Suggestion.create(
  category: "Activity",
  name: "Ponte Luis I",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  comment: "A must see, definitly!",
  photo: get_photo("Ponte Luis I"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Ponte Luis I").normalize}",
  location: "Pte. Luiz I, Porto, Portugal",
  opening_hours: get_opening_hours("Ponte Luis I"),
)

suggestion_6 = Suggestion.create(
  category: "Activity",
  name: "Cruzeiro das seis pontes",
  day: portugal_trip.days.first,
  user: portugal_trip.users[3],
  price: 65,
  comment: "We spend a very good time going that cruise",
  photo: get_photo("Cruzeiro das seis pontes"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Cruzeiro das seis pontes").normalize}",
  location: "Muelle de, 4050-513, Portugal",
  opening_hours: get_opening_hours("Cruzeiro das seis pontes"),
)

suggestion_7 = Suggestion.create(
  category: "Hotel",
  name: "Dom João Lisboa",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 100,
  comment: "Newt to Rossio area, perfect to start visiting the city",
  photo: get_photo("Dom João Lisboa"),
  location: "R. José Estêvão 43, 1150-200 Lisboa, Portugal",
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Dom João Lisboa").normalize}",
  opening_hours: get_opening_hours("Dom João Lisboa"),
)

suggestion_8 = Suggestion.create(
  category: "Hotel",
  name: "Hotel Borges Chiado",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 140,
  comment: "This hotel is in the town center",
  photo: get_photo("Hotel Borges Chiado"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Hotel Borges Chiado").normalize}",
  location: "R. Garrett 108, 1200-205 Lisboa, Portugal",
  opening_hours: get_opening_hours("Hotel Borges Chiado"),
)

suggestion_9 = Suggestion.create(
  category: "Hotel",
  name: "Vincci Porto",
  day: portugal_trip.days[5],
  user: portugal_trip.users[4],
  price: 90,
  comment: "I think they have a gym in the building",
  photo: get_photo("Vincci Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Vincci Porto").normalize}",
  location: "Alameda de Basílio Teles 29, 4150-127 Porto, Portugal",
  opening_hours: get_opening_hours("Vincci Porto"),
)

suggestion_10 = Suggestion.create(
  category: "Restaurant",
  name: "Frade dos Mares",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 80,
  comment: "The good look delicious we should try to go",
  photo: get_photo("Frade dos Mares"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Frade dos Mares").normalize}",
  location: "Av. Dom Carlos i 55A, 1200-647 Lisboa, Portugal",
  opening_hours: get_opening_hours("Frade dos Mares"),
)

suggestion_11 = Suggestion.create(
  category: "Activity",
  name: "Museo National de Azulejo",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 10,
  comment: "A prestigious museum that I want visit",
  photo: get_photo("Museo National de Azulejo"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Museo National de Azulejo").normalize}",
  location: "R. Me. Deus 4, 1900-312 Lisboa, Portugal",
  opening_hours: get_opening_hours("Museo National de Azulejo"),
)

suggestion_12 = Suggestion.create(
  category: "Hotel",
  name: "Moov Hotel Porto Centro",
  day: portugal_trip.days[0],
  user: portugal_trip.users[3],
  price: 10,
  comment: "The bigger zoo of the country",
  photo: get_photo("Moov Hotel Porto Centro"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Moov Hotel Porto Centro").normalize}",
  location: "Praça da Batalha 32, 4000-101 Porto, Portugal",
  opening_hours: get_opening_hours("Moov Hotel Porto Centro"),
)

suggestion_13 = Suggestion.create(
  category: "Activity",
  name: "Jardim dos Aciprestes",
  day: portugal_trip.days[1],
  user: portugal_trip.users[2],
  price: 25,
  comment: "I want do this big amusement park",
  photo: get_photo("Jardim dos Aciprestes"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Jardim dos Aciprestes").normalize}",
  location: "Av. Tomás Ribeiro 18, 2795-164 Linda-a-Velha, Portugal",
  opening_hours: get_opening_hours("Jardim dos Aciprestes"),
)

suggestion_14 = Suggestion.create(
  category: "Hotel",
  name: "Vera Cruz Porto Downtown Hotel",
  day: portugal_trip.days[0],
  user: portugal_trip.users[4],
  price: 38,
  comment: "Cheap place for the middle journey",
  photo: get_photo("Vera Cruz Porto Downtown Hotel"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Vera Cruz Porto Downtown Hotel").normalize}",
  location: "R. de Ramalho Ortigão 14, 4000-407 Porto, Portugal",
  opening_hours: get_opening_hours("Vera Cruz Porto Downtown Hotel"),
)

suggestion_15 = Suggestion.create(
  category: "Activity",
  name: "Praia de miramar",
  day: portugal_trip.days[0],
  user: portugal_trip.users[3],
  comment: "Very cool beach to see",
  photo: get_photo("Praia de miramar"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Praia de miramar").normalize}",
  location: "Arcozelo, Portugal",
  opening_hours: get_opening_hours("Praia de miramar"),
)

suggestion_16 = Suggestion.create(
  category: "Activity",
  name: "Nazare beach",
  day: portugal_trip.days[4],
  user: portugal_trip.users[5],
  comment: "The biggest waves of the world but a bit far from Porto",
  photo: get_photo("Nazare beach"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Nazare beach").normalize}",
  location: "Praia da Nazare",
  opening_hours: get_opening_hours("Nazare beach"),
)

suggestion_17 = Suggestion.create(
  category: "Activity",
  name: "Double viewpoint De Loivos",
  day: portugal_trip.days[3],
  user: portugal_trip.users[3],
  price: 25,
  comment: "Very cool cruize recommended by my cousin",
  photo: get_photo("Double viewpoint De Loivos"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Double viewpoint De Loivos").normalize}",
  location: "R. Praça de Oliveira 1, 5085-010 Casal de Loivos, Portugal",
  opening_hours: get_opening_hours("Double viewpoint De Loivos"),
)

suggestion_18 = Suggestion.create(
  category: "Activity",
  name: "Clérigos Tower",
  day: portugal_trip.days[0],
  user: portugal_trip.users[2],
  price: 5,
  comment: "They say the view really worth the pain to get there",
  photo: get_photo("Clérigos Tower"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Clérigos Tower").normalize}",
  location: "R. de São Filipe de Nery, 4050-546 Porto, Portugal",
  opening_hours: get_opening_hours("Clérigos Tower"),
)

suggestion_19 = Suggestion.create(
  category: "Activity",
  name: "São Bento Station",
  day: portugal_trip.days[5],
  user: portugal_trip.users[3],
  price: 25,
  comment: "Only opens on morning",
  photo: get_photo("São Bento Station Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("São Bento Station").normalize}",
  location: "Praça de Almeida Garrett, 4000-069 Porto, Portugal",
  opening_hours: get_opening_hours("São Bento Station"),
)

suggestion_20 = Suggestion.create(
  category: "Restaurant",
  name: "Mercado Bom Sucesso",
  day: portugal_trip.days[5],
  user: portugal_trip.users[1],
  price: 15,
  comment: "Lot of different things to eat, cheap prices !",
  photo: get_photo("Mercado Bom Sucesso"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Mercado Bom Sucesso").normalize}",
  location: "Praça do Bom Sucesso 74-90, 4150-145 Porto, Portugal",
  opening_hours: get_opening_hours("Mercado Bom Sucesso"),
)

suggestion_21 = Suggestion.create(
  category: "Restaurant",
  name: "Mercado Beira-Rio",
  day: portugal_trip.days[5],
  user: portugal_trip.users[2],
  price: 25,
  comment: "The place to eat traditional portuguese food ",
  photo: get_photo("Mercado Beira-Rio"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Mercado Beira-Rio").normalize}",
  location: "Av. de Ramos Pinto 148, 4400-261 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("Mercado Beira-Rio"),
)

suggestion_22 = Suggestion.create(
  category: "Activity",
  name: "fondation de Serralves",
  day: portugal_trip.days[5],
  user: portugal_trip.users[2],
  comment: "A cool hike to discover the city on first days",
  photo: get_photo("fondation de Serralves"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("fondation de Serralves").normalize}",
  location: "R. Dom João de Castro 210, 4150-417 Porto, Portugal",
  opening_hours: get_opening_hours("fondation de Serralves"),
)

suggestion_23 = Suggestion.create(
  category: "Activity",
  name: "Jardim do Passeio Alegre",
  day: portugal_trip.days[5],
  user: portugal_trip.users[2],
  price: 25,
  comment: "The coolest praia arround, let's chill there.",
  photo: get_photo("Jardim do Passeio Alegre"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Jardim do Passeio Alegre").normalize}",
  location: "R. do Passeio Alegre 828, 4150-570 Porto, Portugal",
  opening_hours: get_opening_hours("Jardim do Passeio Alegre"),
  )

suggestion_24 = Suggestion.create(
  category: "Restaurant",
  name: "Requinte Francesinhas",
  day: portugal_trip.days[5],
  user: portugal_trip.users[5],
  price: 25,
  comment: "Street food spot !",
  photo: get_photo("Requinte Francesinhas"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Requinte Francesinhas").normalize}",
  location: "R. Godinho 837, 4450-150 Matosinhos, Portugal",
  opening_hours: get_opening_hours("Requinte Francesinhas"),
)

suggestion_25 = Suggestion.create(
  category: "Activity",
  name: "Espaço Porto Cruz",
  day: portugal_trip.days[5],
  user: portugal_trip.users[5],
  price: 25,
  comment: "wine tasting : We can have a group discount",
  photo: get_photo("Espaço Porto Cruz"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Espaço Porto Cruz").normalize}",
  location: "Largo Miguel Bombarda 23, 4400-222 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("Espaço Porto Cruz"),
)

suggestion_26 = Suggestion.create(
  category: "Activity",
  name: "Sé cathedral Porto",
  day: portugal_trip.days[5],
  user: portugal_trip.users[2],
  price: 5,
  comment: "The most amazing church my parents told me.",
  photo: get_photo("Sé cathedral Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Sé cathedral").normalize}",
  location: "Terreiro da Sé, 4050-573 Porto, Portugal",
  opening_hours: get_opening_hours("Sé cathedral Porto"),
)

suggestion_27 = Suggestion.create(
  category: "Restaurant",
  name: "Café Santiago Porto",
  day: portugal_trip.days[5],
  user: portugal_trip.users[1],
  price: 10,
  comment: "We should go there to get Franceshinha and Super Bock.",
  photo: get_photo("Café Santiago Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Café Santiago").normalize}",
  location: "R. de Passos Manuel 226, 4000-382 Porto, Portugal",
  opening_hours: get_opening_hours("Café Santiago Porto"),
)

suggestion_28 = Suggestion.create(
  category: "Activity",
  name: "Casa do Infante",
  day: portugal_trip.days[0],
  user: portugal_trip.users[2],
  comment: "A bit of History ! Open on sunday morning",
  photo: get_photo("Casa do Infante"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Casa do Infante").normalize}",
  location: "R. da Alfândega 10, 4050-029 Porto, Portugal",
  opening_hours: get_opening_hours("Casa do Infante"),
)

suggestion_29 = Suggestion.create(
  category: "Restaurant",
  name: "CASA DA MARIQUINHAS",
  day: portugal_trip.days[0],
  user: portugal_trip.users[5],
  price: 17,
  comment: "Looks regular that nice but they have amazing food",
  photo: get_photo("CASA DA MARIQUINHAS"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("CASA DA MARIQUINHAS").normalize}",
  location: "R. de São Sebastião 25, Porto, Portugal",
  opening_hours: get_opening_hours("CASA DA MARIQUINHAS"),
)

suggestion_30 = Suggestion.create(
  category: "Restaurant",
  name: "BULHAO BOLHÃO",
  day: portugal_trip.days[3],
  user: portugal_trip.users[4],
  price: 35,
  comment: "More expensive that the rest, true ! But much better my local friends said.",
  photo: get_photo("BULHAO BOLHÃO"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("BULHAO BOLHÃO").normalize}",
  location: "R. de Sá da Bandeira nº 490, 4000-430 Porto, Portugal",
  opening_hours: get_opening_hours("BULHAO BOLHÃO"),
)

suggestion_31 = Suggestion.create(
  category: "Hotel",
  name: "The Yeatman",
  day: portugal_trip.days[5],
  user: portugal_trip.users[5],
  price: 98,
  comment: "The pool looks super cool !",
  photo: get_photo("The Yeatman"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("The Yeatman").normalize}",
  location: "Rua do Choupelo, 4400-088 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("The Yeatman"),
)

suggestion_32 = Suggestion.create(
  category: "Hotel",
  name: "InterContinental Hotel Porto",
  day: portugal_trip.days[0],
  user: portugal_trip.users[6],
  price: 134,
  comment: "I´ve tried it in Vienna, it was all perfect !",
  photo: get_photo("InterContinental Hotel Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("InterContinental Hotel Porto").normalize}",
  location: "Praça da Liberdade 25, 4000-322 Porto, Portugal",
  opening_hours: get_opening_hours("InterContinental Hotel Porto"),
)

suggestion_33 = Suggestion.create(
  category: "Hotel",
  name: "Pestana Vintage Porto",
  day: portugal_trip.days[6],
  user: portugal_trip.users[3],
  price: 76,
  comment: "Super nice place, very centrical",
  photo: get_photo("Pestana Vintage Porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Pestana Vintage Porto").normalize}",
  location: "Praça Ribeira nº1, 4050-513 Porto, Portugal",
  opening_hours: get_opening_hours("Pestana Vintage Porto"),
)

suggestion_34 = Suggestion.create(
  category: "Hotel",
  name: "Torel Palace porto",
  day: portugal_trip.days[5],
  user: portugal_trip.users[1],
  price: 62,
  comment: "Price is very correct and .. Breakfast Included !",
  photo: get_photo("Torel Palace porto"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Torel Palace porto").normalize}",
  location: "Rua de Entreparedes 42, 4000-198 Porto, Portugal",
  opening_hours: get_opening_hours("Torel Palace porto"),
)

suggestion_35 = Suggestion.create(
  category: "Hotel",
  name: "Vinha Boutique Hotel",
  day: portugal_trip.days[3],
  user: portugal_trip.users[5],
  price: 86,
  comment: "Typical place recommended by my colleagues from work.",
  photo: get_photo("Vinha Boutique Hotel"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("Vinha Boutique Hotel").normalize}",
  location: "R. Canos, 4430-604 Vila Nova de Gaia, Portugal",
  opening_hours: get_opening_hours("Vinha Boutique Hotel"),
)

suggestion_36 = Suggestion.create(
  category: "Activity",
  name: "O Clube - Monsanto Secret Spot",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 86,
  comment: "largest park of the city, amazing point of view",
  photo: get_photo("O Clube - Monsanto Secret Spot"),
  google_link: "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse("O Clube - Monsanto Secret Spot").normalize}",
  location: "Estr. Barcal 1500, Lisboa, Portugal",
  opening_hours: get_opening_hours("O Clube - Monsanto Secret Spot"),
)

puts "Suggestions created"

puts "creating votes"

vote_1 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_1,
)

vote_2 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_1,
)

vote_3 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_2,
)

vote_81 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_2,
)

vote_4 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_2,
)

vote_5 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_4,
)

vote_6 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_5,
)

vote_7 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_8,
)

vote_8 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_11,
)

vote_9 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_13,
)

vote_10 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_16,
)

vote_11 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_21,
)

vote_12 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_26,
)

vote_13 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_25,
)

vote_14 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_28,
)

vote_15 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_30,
)

vote_16 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_34,
)

vote_80 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_5,
)

vote_30 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_4,
)

vote_31 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_8,
)

vote_32 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_9,
)

vote_33 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_13,
)

vote_34 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_14,
)

vote_35 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_19,
)

vote_36 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_20,
)

vote_37 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_22,
)

vote_38 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_26,
)

vote_39 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_28,
)

vote_40 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_31,
)

vote_41 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: suggestion_34,
)

vote_42 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_4,
)

vote_43 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_7,
)

vote_44 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_9,
)

vote_45 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_11,
)

vote_46 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_16,
)

vote_47 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_20,
)

vote_48 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_21,
)

vote_49 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_22,
)

vote_50 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_28,
)

vote_52 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_34,
)

vote_53 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_4,
)

vote_54 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_9,
)

vote_55 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_14,
)

vote_56 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_15,
)

vote_57 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_17,
)

vote_58 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_18,
)

vote_59 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_20,
)

vote_60 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_21,
)

vote_61 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_23,
)

vote_62 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_27,
)

vote_63 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_28,
)

vote_64 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_30,
)

vote_65 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: suggestion_31,
)

vote_66 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_3,
)

vote_67 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_5,
)

vote_68 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_9,
)

vote_69 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_10,
)

vote_70 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_12,
)

vote_71 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_17,
)

vote_72 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_19,
)

vote_73 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_25,
)

vote_74 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_26,
)

vote_75 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_27,
)

vote_76 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_28,
)

vote_77 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_33,
)

vote_78 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_34,
)

vote_79 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_15,
)

vote_80 = Vote.create(
  user: portugal_trip.users[5],
  suggestion: suggestion_15,
)

vote_82 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: suggestion_36,
)

vote_82 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: suggestion_5,
)

puts "Votes created"

puts "DB all set, now have fun"
