puts "🌱 Seeding spices..."

# Seed your database here

nyc = City.create(city_name: "New York City", state: "NY", country: "USA")
sf = City.create(city_name: "San Francisco", state: "CA", country: "USA")
madtown = City.create(city_name: "Madison", state: "WI", country: "USA")

activity_types = ["Playground", "Nature", "Museum", "Store", "Class" ]

25.times do
  Location.create(
    location_name: Faker::Restaurant.name,
    city_id: City.all.sample.id,
    activity_type: activity_types.sample,
    outdoor: Faker::Boolean.boolean,
    indoor: Faker::Boolean.boolean,
    free: Faker::Boolean.boolean,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    photo: Faker::LoremFlickr.image,
    address: Faker::Address.street_address,
    borough: Faker::Address.community,
    neighborhood: Faker::Address.community 
  )
end

50.times do
  User.create(
    user_name: Faker::Name.name,
    password: Faker::Internet.password(max_length: 10),
    city_id: City.all.sample.id,
    number_of_kids: rand(1..4),
    photo: Faker::LoremFlickr.image
  )
end

100.times do
  Kid.create(
    user_id: User.all.sample.id,
    first_initial: Faker::Name.initials(number: 1),
    age: rand(0..12)
  )
end

150.times do
  Review.create(
    location_id: Location.all.sample.id,
    user_id: User.all.sample.id,
    activities: Faker::Hipster.words(number: 4),
    review: Faker::Lorem.paragraph(sentence_count: 2),
    baby_rating: rand(1..5),
    toddler_rating: rand(1..5),
    preschool_rating: rand(1..5),
    school_age_rating: rand(1..5),
    adult_rating: rand(1..5),
    general_rating: rand(1..5),
    favorite: Faker::Boolean.boolean,
    want_to_visit: Faker::Boolean.boolean,
    visited: Faker::Boolean.boolean,
    time_spent: rand(1..120),
    fun_factor: rand(1..5),
    educational_value: rand(1..5)
  )
end


puts "✅ Done seeding!"
