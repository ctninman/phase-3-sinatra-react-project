class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # get '/best_adult_locations' do
  #   Location.all.each do |loc|
  #     average_adult_rating = loc.reviews.average(:adult_rating)
  #     Location.order(average_adult_rating: :desc).to_json
  #   end
  # end

end
