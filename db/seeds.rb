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
  comment: "Super view on the beach and nice breakfast"
)

suggestion_2 = Suggestion.create(
  category: "Restaurant",
  name: "casa bonita",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  price: 12.30,
  comment: "Close to hotel, super rating on G Maps"
)

suggestion_3 = Suggestion.create(
  category: "Restaurant",
  name: "Meia-Nau Porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 40,
  comment: "The food is amazing and the prices very decente"
)

suggestion_4 = Suggestion.create(
  category: "Activity",
  name: "Praia de salgueiro",
  day: portugal_trip.days.first,
  user: portugal_trip.users.third,
  comment: "very crowded and has big waves!"
)

suggestion_5 = Suggestion.create(
  category: "Activity",
  name: "Ponte Luis I",
  day: portugal_trip.days.first,
  user: portugal_trip.users.second,
  comment: "A must see, definitly!"
)

suggestion_6 = Suggestion.create(
  category: "Activity",
  name: "Cruzeiros Douro",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 65,
  comment: "We spend a very good time going that cruise"
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
