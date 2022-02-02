class CitiesController < ApplicationController

  def serialize_cities(objects)
    objects.to_json(include: [:locations, :users])
  end

  get '/cities' do
    serialize_cities(City.all)
  end

  get '/cities/:id' do
    serialize_cities(City.find(params[:id]))
  end

  delete '/cities/:id' do
    city = City.find(params[:id])
    city.destroy
    {message: 'City deleted'}.to_json
  end

  post '/cities' do
    city = City.create(
      city_name: params[:city_name],
      state: params[:state],
      country: params[:country]
    )
    serialize_cities(city)
  end

end