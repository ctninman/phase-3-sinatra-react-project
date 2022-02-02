class ReviewsController < ApplicationController

  def serialize_reviews(objects)
    objects.to_json(include: [:user, :location])
  end

  get '/reviews' do
    serialize_reviews(Review.all)
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