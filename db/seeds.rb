puts "destroying all datas"
Vote.destroy_all
Suggestion.destroy_all
Day.destroy_all
TripMember.destroy_all
Trip.destroy_all
User.destroy_all
puts "All exisiting data destroyed"

puts "creating users"
romain = User.create(
  email: "romain@example.com",
  password: "secret",
  first_name: "romain",
  last_name: "duwagon"
  )

camille = User.create(
  email: "camille@example.com",
  password: "secret",
  first_name: "camille",
  last_name: "duwagon"
  )

anastasia = User.create(
  email: "anastasia@example.com",
  password: "secret",
  first_name: "anastasia",
  last_name: "duwagon"
  )

vincent = User.create(
  email: "vincent@example.com",
  password: "secret",
  first_name: "vincent",
  last_name: "duwagon"
  )

largo = User.create(
  email: "largo@example.com",
  password: "secret",
  first_name: "largo",
  last_name: "duwagon"
  )

maria = User.create(
  email: "maria@example.com",
  password: "secret",
  first_name: "maria",
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
  photo: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/75/cd/b5/bosque-do-porto-praia.jpg?w=900&h=-1&s=1"
)

suggestion_2 = Suggestion.create(
  category: "Restaurant",
  name: "Sabores da Amazónia",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  price: 12.30,
  comment: "Close to hotel, super rating on G Maps",
  photo: "https://b.zmtcdn.com/data/pictures/9/18988569/b086082c7b2e6c100c1766bde7e1c0f3.jpg"
)

suggestion_3 = Suggestion.create(
  category: "Restaurant",
  name: "Meia-Nau Porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 40,
  comment: "The food is amazing and the prices very decent",
  photo: "https://media-cdn.tripadvisor.com/media/photo-s/1d/29/4a/44/sala-de-refeicoes.jpg"
)

suggestion_4 = Suggestion.create(
  category: "Activity",
  name: "Praia de salgueiro, porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.third,
  comment: "very crowded and has big waves!",
  photo: "https://cdn.visitportugal.com/sites/default/files/styles/encontre_detalhe_poi_destaque/public/mediateca/N4.PRA1587D.jpg?itok=5FNkDWK0"
)

suggestion_5 = Suggestion.create(
  category: "Activity",
  name: "Ponte Luis I",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  comment: "A must see, definitly!",
  photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Puente_de_Don_Luis_I%2C_Oporto%2C_Portugal%2C_2019-06-02%2C_DD_29-31_HDR.jpg/700px-Puente_de_Don_Luis_I%2C_Oporto%2C_Portugal%2C_2019-06-02%2C_DD_29-31_HDR.jpg"
)

suggestion_6 = Suggestion.create(
  category: "Activity",
  name: "Cruzeiros Douro",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 65,
  comment: "We spend a very good time going that cruise",
  photo: "https://media-cdn.tripadvisor.com/media/photo-s/1a/f1/75/aa/cruzeiros-no-rio-douro.jpg"
)

suggestion_7 = Suggestion.create(
  category: "Hotel",
  name: "Hotel Quarteira Sol",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 180,
  comment: "A beautiful view on the beach",
  photo: "https://lh3.googleusercontent.com/proxy/00MuFW27_JfMtcSQAY4hV_aiktVY1pPsuwgw-rD-kyAivqENzsCkK9fO7kRa9KILsdyqevBymfxTF8zkXYqLeqfZyZp548r7tzyjF0R8BFigxTxlJYhtvbjyMh_EImCgpJUDdOdYqc5O5TUyNhn6AmIxirYPLPdWMBFt-wVUWwg"
)

suggestion_8 = Suggestion.create(
  category: "Hotel",
  name: "Hotel Borges Chiado",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 140,
  comment: "This hotel is in the town center",
  photo: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/259345247.jpg?k=f969c5b0d5c974425624376ebfa5db33c8057878badb5998a473e4578ac984c1&o=&hp=1"
)

suggestion_9 = Suggestion.create(
  category: "Restaurant",
  name: "Augusto Lisboa",
  day: portugal_trip.days[1],
  user: portugal_trip.users[4],
  price: 90,
  comment: "A very good place to eat good food",
  photo: "https://media-cdn.tripadvisor.com/media/photo-s/18/e3/c2/11/after-a-walk-in-alfama.jpg"
)

suggestion_10 = Suggestion.create(
  category: "Restaurant",
  name: "Frade dos Mares",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 80,
  comment: "The good look delicious we should try to go",
  photo: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/a820c569-de5a-4d0c-a0c4-bbd46bcbd672/1354226d-f84e-4fe8-b61c-27bef095c978.jpg"
)

suggestion_11 = Suggestion.create(
  category: "Activity",
  name: "Museo National del Arte",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 10,
  comment: "A prestigious museum that I want visit",
  photo: "https://cdn.visitportugal.com/sites/default/files/styles/encontre_detalhe_poi_destaque/public/mediateca/%C2%A9MNAA-Gallery-of-Portuguese-Paintings-2013_660x371.jpg?itok=bozrNfHv"
)

suggestion_12 = Suggestion.create(
  category: "Activity",
  name: "Jardim Zoológico de Lisboa",
  day: portugal_trip.days[1],
  user: portugal_trip.users[3],
  price: 10,
  comment: "The bigger zoo of the country",
  photo: "https://images.impresa.pt/sicnot/2020-05-06-Jardim-Zoologico_Torreoes--2-.jpg/original/mw-860"
)

suggestion_13 = Suggestion.create(
  category: "Activity",
  name: "Adventure Park",
  day: portugal_trip.days[1],
  user: portugal_trip.users[2],
  price: 25,
  comment: "I want do this big amusement park",
  photo: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/6b/93/f7/mega-circuito-up-to-14.jpg?w=1200&h=-1&s=1"
)

puts "Suggestions created"

puts "creating votes"

vote_1 = Vote.create(
  user: portugal_trip.users.first,
  suggestion: portugal_trip.days.first.suggestions.first,
)

vote_2 = Vote.create(
  user: portugal_trip.users.second,
  suggestion: portugal_trip.days.first.suggestions.first,
)

vote_3 = Vote.create(
  user: portugal_trip.users.third,
  suggestion: portugal_trip.days.first.suggestions.second,
)
puts "Votes created"

puts "DB all set, now have fun"
