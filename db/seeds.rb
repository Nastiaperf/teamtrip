puts "destroying all datas"
Vote.destroy_all
Suggestion.destroy_all
Day.destroy_all
TripMember.destroy_all
Trip.destroy_all
User.destroy_all
puts "All exisiting data destroyed"

def get_photo(name)
  url = Addressable::URI.parse("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{name}&inputtype=textquery&fields=formatted_address%2Cphoto%2Crating%2Copening_hours&key=AIzaSyD9TVwPVhLsV4XkHFI6fiAkcJ31IqNPGxA")
  response = HTTParty.get("https://maps.googleapis.com#{url.normalize.request_uri}")
  return photo = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{response['candidates'][0]['photos'][0]['photo_reference']}&sensor=false&maxheight=500&maxwidth=500&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
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
  email: "charly@example.com",
  password: "secret",
  first_name: "Sebastien",
  last_name: "duwagon"
  )

puts "users created"

puts "creating trip"

portugal_trip = Trip.create(
  name: "Portugal Voyage 2022",
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
  name: "Hotel praia do porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 80,
  comment: "Super view on the beach and nice breakfast",
  photo: get_photo("Hotel praia do porto")
)

suggestion_2 = Suggestion.create(
  category: "Restaurant",
  name: "Sabores da Amazónia",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  price: 12.30,
  comment: "Close to hotel, super rating on G Maps",
  photo: get_photo("Sabores da Amazónia")
)

suggestion_3 = Suggestion.create(
  category: "Restaurant",
  name: "Meia-Nau Porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 40,
  comment: "The food is amazing and the prices very decent",
  photo: get_photo("Meia-Nau Porto")
)

suggestion_4 = Suggestion.create(
  category: "Activity",
  name: "Praia de salgueiro, porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.third,
  comment: "very crowded and has big waves!",
  photo: get_photo("Praia de salgueiro, porto")
)

suggestion_5 = Suggestion.create(
  category: "Activity",
  name: "Ponte Luis I",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  comment: "A must see, definitly!",
  photo: get_photo("Ponte Luis I")
)

suggestion_6 = Suggestion.create(
  category: "Activity",
  name: "Cruzeiros Douro",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 65,
  comment: "We spend a very good time going that cruise",
  photo: get_photo("Cruzeiros Douro")
)

suggestion_7 = Suggestion.create(
  category: "Hotel",
  name: "Hotel Quarteira Sol",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 180,
  comment: "A beautiful view on the beach",
  photo: get_photo("Hotel Quarteira Sol")
)

suggestion_8 = Suggestion.create(
  category: "Hotel",
  name: "Hotel Borges Chiado",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 140,
  comment: "This hotel is in the town center",
  photo: get_photo("Hotel Borges Chiado")
)

suggestion_9 = Suggestion.create(
  category: "Hotel",
  name: "Vincci Porto",
  day: portugal_trip.days[5],
  user: portugal_trip.users[4],
  price: 90,
  comment: "I think they have a gym in the building",
  photo: get_photo("Vincci Porto")
)

suggestion_10 = Suggestion.create(
  category: "Restaurant",
  name: "Frade dos Mares",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 80,
  comment: "The good look delicious we should try to go",
  photo: get_photo("Frade dos Mares")
)

suggestion_11 = Suggestion.create(
  category: "Activity",
  name: "Museo National de Azulejo",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 10,
  comment: "A prestigious museum that I want visit",
  photo: get_photo("Museo National de Azulejo")
)

suggestion_12 = Suggestion.create(
  category: "Hotel",
  name: "Moov Hotel Porto Centro",
  day: portugal_trip.days[8],
  user: portugal_trip.users[3],
  price: 10,
  comment: "The bigger zoo of the country",
  photo: get_photo("Moov Hotel Porto Centro")
)

suggestion_13 = Suggestion.create(
  category: "Activity",
  name: "Jardim dos Aciprestes",
  day: portugal_trip.days[1],
  user: portugal_trip.users[2],
  price: 25,
  comment: "I want do this big amusement park",
  photo: get_photo("Jardim dos Aciprestes")
)

suggestion_14 = Suggestion.create(
  category: "Hotel",
  name: "Vera Cruz Porto Downtown Hotel",
  day: portugal_trip.days[5],
  user: portugal_trip.users[4],
  price: 38,
  comment: "Cheap place for the middle journey",
  photo: get_photo("Vera Cruz Porto Downtown Hotel")
)

suggestion_15 = Suggestion.create(
  category: "Activity",
  name: "Praia de miramar",
  day: portugal_trip.days[3],
  user: portugal_trip.users[3],
  comment: "Very cool beach to see",
  photo: get_photo("Praia de miramar")
)

suggestion_16 = Suggestion.create(
  category: "Activity",
  name: "Praia de Nazare",
  day: portugal_trip.days[4],
  user: portugal_trip.users[5],
  comment: "The biggest waves of the world but a bit far from Porto",
  photo: get_photo("Praia de Nazare")
)

suggestion_17 = Suggestion.create(
  category: "Activity",
  name: "Pinhão",
  day: portugal_trip.days[3],
  user: portugal_trip.users[3],
  price: 25,
  comment: "Very cool cruize recommended by my cousin",
  photo: get_photo("Pinhão")
)

suggestion_18 = Suggestion.create(
  category: "Activity",
  name: "Torre dos Clérigos",
  day: portugal_trip.days[4],
  user: portugal_trip.users[2],
  price: 5,
  comment: "They say the view really worth the pain to get there",
  photo: get_photo("Torre dos Clérigos")
)

suggestion_19 = Suggestion.create(
  category: "Activity",
  name: "Igreja de São Francisco",
  day: portugal_trip.days[2],
  user: portugal_trip.users[3],
  price: 25,
  comment: "Only opens on morning",
  photo: get_photo("Igreja de São Francisco Porto")
)

suggestion_20 = Suggestion.create(
  category: "Restaurant",
  name: "Mercado Bom Sucesso",
  day: portugal_trip.days[8],
  user: portugal_trip.users[1],
  price: 15,
  comment: "Lot of different things to eat, cheap prices !",
  photo: get_photo("Mercado Bom Sucesso")
)

suggestion_21 = Suggestion.create(
  category: "Restaurant",
  name: "Mercado Beira-Rio",
  day: portugal_trip.days[3],
  user: portugal_trip.users[2],
  price: 25,
  comment: "The place to eat traditional portuguese food ",
  photo: get_photo("Mercado Beira-Rio")
)

suggestion_22 = Suggestion.create(
  category: "Activity",
  name: "Serralves Porto",
  day: portugal_trip.days[2],
  user: portugal_trip.users[2],
  comment: "A cool hike to discover the city on first days",
  photo: get_photo("Serralves Porto")
)

suggestion_23 = Suggestion.create(
  category: "Activity",
  name: "Foz do Douro",
  day: portugal_trip.days[1],
  user: portugal_trip.users[2],
  price: 25,
  comment: "The coolest praia arround, let's chill there.",
  photo: get_photo("Foz do Douro")
)

suggestion_24 = Suggestion.create(
  category: "Restaurant",
  name: "Matosinhos",
  day: portugal_trip.days[2],
  user: portugal_trip.users[5],
  price: 25,
  comment: "Street food spot !",
  photo: get_photo("Matosinhos")
)

suggestion_25 = Suggestion.create(
  category: "Activity",
  name: "Espaço Porto Cruz",
  day: portugal_trip.days[6],
  user: portugal_trip.users[5],
  price: 25,
  comment: "wine tasting : We can have a group discount",
  photo: get_photo("Espaço Porto Cruz")
)

suggestion_26 = Suggestion.create(
  category: "Activity",
  name: "Sé cathedral",
  day: portugal_trip.days[4],
  user: portugal_trip.users[2],
  price: 5,
  comment: "The most amazing church my parents told me.",
  photo: get_photo("Sé cathedral Porto")
)

suggestion_27 = Suggestion.create(
  category: "Restaurant",
  name: "Café Santiago",
  day: portugal_trip.days[2],
  user: portugal_trip.users[1],
  price: 10,
  comment: "We should go there to get Franceshinha and Super Bock.",
  photo: get_photo("Café Santiago Porto")
)

suggestion_28 = Suggestion.create(
  category: "Activity",
  name: "Casa do Infante",
  day: portugal_trip.days[1],
  user: portugal_trip.users[2],
  comment: "A bit of History ! Open on sunday morning",
  photo: get_photo("Casa do Infante")
)

suggestion_29 = Suggestion.create(
  category: "Restaurant",
  name: "CASA DA MARIQUINHAS",
  day: portugal_trip.days[4],
  user: portugal_trip.users[5],
  price: 17,
  comment: "Looks regular that nice but they have amazing food",
  photo: get_photo("CASA DA MARIQUINHAS")
)

suggestion_30 = Suggestion.create(
  category: "Restaurant",
  name: "BULHAO BOLHÃO",
  day: portugal_trip.days[3],
  user: portugal_trip.users[4],
  price: 35,
  comment: "More expensive that the rest, true ! But much better my local friends said.",
  photo: get_photo("BULHAO BOLHÃO")
)

suggestion_31 = Suggestion.create(
  category: "Hotel",
  name: "The Yeatman",
  day: portugal_trip.days[6],
  user: portugal_trip.users[5],
  price: 98,
  comment: "The pool looks super cool !",
  photo: get_photo("The Yeatman")
)

suggestion_32 = Suggestion.create(
  category: "Hotel",
  name: "InterContinental Hotel Porto",
  day: portugal_trip.days[2],
  user: portugal_trip.users[6],
  price: 134,
  comment: "I´ve tried it in Vienna, it was all perfect !",
  photo: get_photo("InterContinental Hotel Porto")
)

suggestion_33 = Suggestion.create(
  category: "Hotel",
  name: "Pestana Vintage Porto",
  day: portugal_trip.days[6],
  user: portugal_trip.users[3],
  price: 76,
  comment: "Super nice place, very centrical",
  photo: get_photo("Pestana Vintage Porto")
)

suggestion_34 = Suggestion.create(
  category: "Hotel",
  name: "Torel Palace porto",
  day: portugal_trip.days[4],
  user: portugal_trip.users[1],
  price: 62,
  comment: "Price is very correct and .. Breakfast Included !",
  photo: get_photo("Torel Palace porto")
)

suggestion_35 = Suggestion.create(
  category: "Hotel",
  name: "Torel Palace porto",
  day: portugal_trip.days[3],
  user: portugal_trip.users[5],
  price: 86,
  comment: "Typical place recommended by my colleagues from work.",
  photo: get_photo("Torel Palace porto")
)

puts "Suggestions created"

puts "creating votes"

vote_1 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[0],
)

vote_2 = Vote.create(
  user: portugal_trip.users[1],
  suggestion: portugal_trip.days.first.suggestions[0],
)

vote_3 = Vote.create(
  user: portugal_trip.users[2],
  suggestion: portugal_trip.days.first.suggestions[1],
)

vote_3 = Vote.create(
  user: portugal_trip.users[3],
  suggestion: portugal_trip.days.first.suggestions[1],
)

vote_4 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[1],
)

vote_5 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[3],
)

vote_6 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[4],
)

vote_7 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[7],
)

vote_8 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[10],
)

vote_9 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[12],
)

vote_10 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[15],
)

vote_11 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[20],
)

vote_12 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[25],
)

vote_13 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[24],
)

vote_14 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[27],
)

vote_15 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[29],
)

vote_16 = Vote.create(
  user: portugal_trip.users[4],
  suggestion: portugal_trip.days.first.suggestions[33],
)

vote_17 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[24],
)

vote_18 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[27],
)

vote_19 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[29],
)

vote_20 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[33],
)

vote_21 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[22],
)

vote_22 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[21],
)

vote_23 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[18],
)

vote_24 = Vote.create(
  user: portugal_trip.users[0],
  suggestion: portugal_trip.days.first.suggestions[17],
)
puts "Votes created"

puts "DB all set, now have fun"
