class UsersController < ApplicationController

  def serialize_users(objects)
    objects.to_json(include: [:kids, :city, :locations, :reviews, favorites: {include: :location}])
  end

  get '/users' do
    serialize_users(User.all)
  end

  get '/users/:id' do
    serialize_users(User.find(params[:id]))
  end

  get '/cities/:id/users' do
    city = City.find(params[:id])
    city_users = city.users
    serialize_users(city_users)
  end

  get '/locations/:id/users' do
    location = Location.find(params[:id])
    location_users = location.users
    serialize_users(location_users)
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
   {message: 'User deleted'}.to_json
  end

  post '/users' do
    user = User.create(
      user_name: params[:user_name],
      city_id: params[:city_id],
      number_of_kids: params[:number_of_kids],
      photo: params[:photo]
    )
    serialize_users(user)
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      user_name: params[:user_name],
      city_id: params[:city_id],
      number_of_kids: params[:number_of_kids],
      photo: params[:photo]
    )
    serialize_users(user)
  end

end