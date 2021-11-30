puts "destroying all datas"
Vote.destroy_all
Suggestion.destroy_all
Day.destroy_all
TripMember.destroy_all
Trip.destroy_all
User.destroy_all
puts "All exisiting data destroyed"

puts "creating users"
romain = User.new(
  email: "romain@example.com",
  password: "secret",
  first_name: "romain",
  last_name: "duwagon"
  )
romain.save!

camille = User.new(
  email: "camille@example.com",
  password: "secret",
  first_name: "camille",
  last_name: "duwagon"
  )
camille.save!

anastasia = User.new(
  email: "anastasia@example.com",
  password: "secret",
  first_name: "anastasia",
  last_name: "duwagon"
  )
anastasia.save!

vincent = User.new(
  email: "vincent@example.com",
  password: "secret",
  first_name: "vincent",
  last_name: "duwagon"
  )
vincent.save!

largo = User.new(
  email: "largo@example.com",
  password: "secret",
  first_name: "largo",
  last_name: "duwagon"
  )
largo.save!

maria = User.new(
  email: "maria@example.com",
  password: "secret",
  first_name: "maria",
  last_name: "duwagon"
  )
maria.save!

puts "users created"

puts "creating trip"

portugal_trip = Trip.new(
  name: "Portugal Voyage 2022",
  start_date: '03/01/2022',
  end_date: '11/01/2022',
  location: "Portugal",
  creator_id: User.first.id # chelou
)
portugal_trip.save!

puts "trip created"


puts "creating trip_members"

trip_member_1 = TripMember.create(
  user: User.first,
  trip: Trip.first
)

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

puts "creating days for the trip"
day_1 = Day.create(
  date: '03/01/2022',
  trip: Trip.first
)
puts "trip days created"

puts "creating suggestions"
suggestion_1 = Suggestion.new(
  category: "Restaurant",
  name: "casa bonita",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 12.30,
  comment: "Close to hotel, super rating on G Maps"
)

suggestion_2 = Suggestion.new(
  category: "Hotel",
  name: "Hotel praia do porto",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  price: 80,
  comment: "Super view on the beach and nice breakfast"
)

suggestion_3 = Suggestion.new(
  category: "Activity",
  name: "Ponte Luis I",
  day: portugal_trip.days.first,
  user: portugal_trip.users.first,
  comment: "A must see, definitly!"
)
puts "Suggestions created"

puts "DB all set, now have fun"
