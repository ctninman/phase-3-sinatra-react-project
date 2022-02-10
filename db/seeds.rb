puts "🌱 Seeding spices..."

# Seed your database here

nyc = City.create(city_name: "New York City", state: "NY", country: "USA", photo: 'https://images.unsplash.com/photo-1543158266-0066955047b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fG5ldyUyMHlvcmslMjBjaXR5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60')
sf = City.create(city_name: "San Francisco", state: "CA", country: "USA", photo: 'https://images.unsplash.com/photo-1475947175089-3a98ee67944b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNhbiUyMGZyYW5jaXNjb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60')
madtown = City.create(city_name: "Madison", state: "WI", country: "USA", photo: 'https://images.unsplash.com/photo-1631804653258-5a5cb4a6af3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFkaXNvbiUyMHdpc2NvbnNpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60')

activity_types = ["Playground", "Nature", "Museum", "Store", "Class", "Art", "Dance", "Music", "Library", "Sport" ]

random_photos = [
  'https://purewows3.imgix.net/images/articles/2020_12/outdoor-dining-nyc-cat.jpg?auto=format,compress&cs=strip',
  'https://images.unsplash.com/photo-1543039625-14cbd3802e7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8b3V0ZG9vcnxlbnwwfHwwfHw%3D&w=1000&q=80',
  'https://www.newyorkupstate.com/resizer/2AO_H62s5KlLm3__Ej6_xsixkkw=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/RQYPHPW4SBFOBBVUMKPGKND44M.jpeg',
  'https://www.smdp.com/wp-content/uploads/2019/03/031119-_-museum2.jpg',
  'https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/yorkcountysc/_Y0A9812_E35C2905-5056-A36A-0BB081FAD7242468-e35c283e5056a36_e35c295d-5056-a36a-0bb8de76121a6208.jpg',
  'https://www.miracle-recreation.com/content/uploads/2018/11/Image-Header_Park.jpg.webp',
  'https://media.timeout.com/images/105422446/image.jpg'
]

25.times do
  Location.create(
    location_name: Faker::Restaurant.name,
    city_id: City.all.sample.id,
    activity_type: activity_types.sample,
    outdoor: Faker::Boolean.boolean,
    indoor: Faker::Boolean.boolean,
    free: Faker::Boolean.boolean,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    photo: random_photos.sample,
    address: Faker::Address.street_address,
    borough: Faker::Address.community,
    neighborhood: Faker::Address.community 
  )
end

50.times do
  User.create(
    user_name: Faker::Name.name,
    password: Faker::Internet.password(max_length: 10),
    email: Faker::Internet.email,
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
    review: Faker::Lorem.paragraph(sentence_count: 2),
    baby_rating: rand(2..5),
    toddler_rating: rand(2..5),
    preschool_rating: rand(2..5),
    school_age_rating: rand(2..5),
    adult_rating: rand(2..5),
    general_rating: rand(2..5),
  )
end

250.times do
  Favorite.create(
    location_id: Location.all.sample.id,
    user_id: User.all.sample.id,
    favorite: Faker::Boolean.boolean,
    want_to_visit: true,
    visited: Faker::Boolean.boolean,
  )
end


puts "✅ Done seeding!"
