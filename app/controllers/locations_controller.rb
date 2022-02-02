class LocationsController < ApplicationController

  def serialize_locations(objects)
    objects.to_json(include: [:reviews, :users, :city])
  end

  get '/locations' do
    serialize_locations(Location.all)
  end

  get '/locations/:id' do
    serialize_locations(Location.find(params[:id]))
  end

  # get '/locations/location_city/:city_id' do
  #   location = Location.where(city_id == params[:city_id])
  #   location.to_json
  # end

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