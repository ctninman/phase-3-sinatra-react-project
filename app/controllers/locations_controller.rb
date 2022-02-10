class LocationsController < ApplicationController

  def serialize_locations(objects)
    objects.to_json(include: [:reviews, :users, :city,], methods: [:average_adult_rating, :average_baby_rating, :average_toddler_rating, :average_preschool_rating, :average_school_age_rating, :average_general_rating])
  end

  get '/locations' do
    serialize_locations(Location.all)
  end

  get '/locations/:id' do
    serialize_locations(Location.find(params[:id]))
  end

  get '/cities/:id/locations' do
    city = City.find(params[:id])
    city_locations = city.locations
    serialize_locations(city_locations)
  end

  get '/cities/:id/locations/baby' do
    city = City.find(params[:id])
    baby_locations = city.locations.select { |l| l.average_baby_rating > 3 }
    serialize_locations(baby_locations)
  end

  get '/cities/:id/locations/toddler' do
    city = City.find(params[:id])
    toddler_locations = city.locations.select { |l| l.average_toddler_rating > 3 }
    serialize_locations(toddler_locations)
  end

  get '/cities/:id/locations/preschool' do
    city = City.find(params[:id])
    preschool_locations = city.locations.select { |l| l.average_preschool_rating > 3 }
    serialize_locations(preschool_locations)
  end

  get '/cities/:id/locations/school_age' do
    city = City.find(params[:id])
    school_age_locations = city.locations.select { |l| l.average_school_age_rating > 3 }
    serialize_locations(school_age_locations)
  end

  get '/cities/:id/locations/adult' do
    city = City.find(params[:id])
    adult_locations = city.locations.select { |l| l.average_adult_rating > 3 }
    serialize_locations(adult_locations)
  end

  get '/cities/:id/locations/general' do
    city = City.find(params[:id])
    general_locations = city.locations.select { |l| l.average_general_rating > 3 }
    serialize_locations(general_locations)
  end

  delete '/locations/:id' do
    location = Location.find(params[:id])
    location.destroy
    {message: 'Location deleted'}.to_json
  end

  post '/locations' do
    location = Location.create(
      location_name: params[:location_name],
      city_id: params[:city_id],
      outdoor: params[:outdoor],
      indoor: params[:indoor],
      free: params[:free],
      description: params[:description],
      photo: params[:photo],
      address: params[:address],
      borough: params[:borough],
      neighborhood: params[:neighborhood],
      activity_type: params[:activity_type]
    )
    serialize_locations(location)
  end

end