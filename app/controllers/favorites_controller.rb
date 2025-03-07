class FavoritesController < ApplicationController

  def serialize_favorites (objects)
    objects.to_json(include: [:location, user: {include: [:city, :locations, :kids, reviews: {include: :location}, favorites: {include: :location}]}])
  end

  get '/users/:id/favorites' do
    user = User.find(params[:id])
    user_favorites = user.favorites
    serialize_favorites(user_favorites)
  end

  post '/favorites' do
    favorite = Favorite.create(
      location_id: params[:location_id],
      user_id: params[:user_id],
      favorite: params[:favorite],
      want_to_visit: params[:want_to_visit],
      visited: params[:visited]    
    )
    serialize_favorites(favorite)
  end

  patch '/favorites/:id' do
    favorite = Favorite.find(params[:id])
    favorite.update(
      favorite: params[:favorite],
      want_to_visit: params[:want_to_visit],
      visited: params[:visited]    
    )
    serialize_favorites(favorite)
  end

  delete '/favorites/:id' do
    favorite = Favorite.find(params[:id])
    favorite.destroy
    serialize_favorites(favorite)
  end

end