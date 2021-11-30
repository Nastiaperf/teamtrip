puts "destroying all datas"
Vote.destroy_all
Suggestion.destroy_all
Day.destroy_all
Trip.destroy_all
TripMember.destroy_all
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

porto_trip = Trip.new(
  name: "Porto Voyage 2022",
  start_date: '03/01/2022',
  end_date: '11/01/2022',
  location: "Porto, Portugal",
  creator_id: "#{User.first.id}",
)

puts "trip created"
