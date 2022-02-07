class FavoritesController < ApplicationController

  def serialize_favorites (objects)
    objects.to_json(include: [:location, user: {include: :favorites}])
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
   {message: 'Favorite deleted'}.to_json
  end

end