class ReviewsController < ApplicationController

  def serialize_reviews(objects)
    objects.to_json(include: [:user, :location])
  end

  get '/reviews' do
    serialize_reviews(Review.all)
  end

  get '/locations/:id/reviews' do
    location = Location.find(params[:id])
    location_reviews = location.reviews
    serialize_reviews(location_reviews)
  end

  get '/users/:id/reviews' do
    user = User.find(params[:id])
    user_reviews = user.reviews
    serialize_reviews(user_reviews)
  end

  get '/reviews/:id' do
    serialize_reviews(Review.find(params[:id]))
  end

  delete '/reviews/:id' do
    review = Review.find(params[:id])
    review.destroy
    {message: 'Review deleted'}.to_json
  end

  post '/reviews' do
    review = Review.create(
      location_id: params[:location_id],
      user_id: params[:user_id],
      activities: params[:activities],
      review: params[:review],
      baby_rating: params[:baby_rating],
      toddler_rating: params[:toddler_rating],
      preschool_rating: params[:preschool_rating],
      school_age_rating: params[:school_age_rating],
      adult_rating: params[:adult_rating],
      general_rating: params[:general_rating],
      favorite: params[:favorite],
      want_to_visit: params[:want_to_visit],
      visited: params[:visited],
      time_spent: params[:time_spent],
      price_per_person: params[:price_per_person],
      fun_factor: params[:fun_factor],
      educational_value: params[:educational_value]
    )
    serialize_reviews(review)
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(
      location_id: params[:location_id],
      user_id: params[:user_id],
      activities: params[:activities],
      review: params[:review],
      baby_rating: params[:baby_rating],
      toddler_rating: params[:toddler_rating],
      preschool_rating: params[:preschool_rating],
      school_age_rating: params[:school_age_rating],
      adult_rating: params[:adult_rating],
      general_rating: params[:general_rating],
      favorite: params[:favorite],
      want_to_visit: params[:want_to_visit],
      visited: params[:visited],
      time_spent: params[:time_spent],
      price_per_person: params[:price_per_person],
      fun_factor: params[:fun_factor],
      educational_value: params[:educational_value]
    )
    serialize_reviews(review)
  end

end

# {
#       "location_id": 1,
#       "user_id": 1,
#       "activities": ["mini-golf", "skating"],
#       "review": "Never going back again",
#       "baby_rating": 4,
#       "toddler_rating": 3,
#       "preschool_rating": 2,
#       "school_age_rating": 1,
#       "adult_rating": 1,
#       "general_rating": 2,
#       "favorite": false,
#       "want_to_visit": false,
#       "visited": true,
#       "time_spent": 50,
#       "price_per_person": 22,
#       "fun_factor": 1,
#       "educational_value": 1
# }