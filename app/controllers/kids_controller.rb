class KidsController < ApplicationController

  def serialize_kids(objects)
    objects.to_json(include: :user)
  end

  get '/kids' do
    serialize_kids(Kid.all)
  end

  get '/kids/:id' do
    serialize_kids(Kid.find(params[:id]))
  end

  delete '/kids/:id' do
    kid = Kid.find(params[:id])
    kid.destroy
    {message: 'Kid deleted'}.to_json
  end

  post '/kids' do
    kid = Kid.create(
      user_id: params[:user_id],
      first_initial: params[:first_initial],
      age: params[:age]
    )
    serialize_kids(kid)
  end

  patch '/kids/:id' do
    kid = Kid.find(params[:id])
    kid.update(
      user_id: params[:user_id],
      first_initial: params[:first_initial],
      age: params[:age]
    )
    serialize_kids(kid)
  end

end