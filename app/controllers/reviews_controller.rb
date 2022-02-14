class ReviewsController < ApplicationController

  def serialize_reviews(objects)
    objects.to_json(include: [:location, user: {include: [:locations, :city, favorites: {include: :location},  reviews: {include: :location} ]}])
  end

  get '/reviews' do
    Review.all.to_json(include: [:user, :location])
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
    serialize_reviews(review)
  end

  post '/reviews' do
    review = Review.create(
      location_id: params[:location_id],
      user_id: params[:user_id],
      review: params[:review],
      baby_rating: params[:baby_rating],
      toddler_rating: params[:toddler_rating],
      preschool_rating: params[:preschool_rating],
      school_age_rating: params[:school_age_rating],
      adult_rating: params[:adult_rating],
      general_rating: params[:general_rating]
    )
    serialize_reviews(review)
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(
      location_id: params[:location_id],
      user_id: params[:user_id],
      review: params[:review],
      baby_rating: params[:baby_rating],
      toddler_rating: params[:toddler_rating],
      preschool_rating: params[:preschool_rating],
      school_age_rating: params[:school_age_rating],
      adult_rating: params[:adult_rating],
      general_rating: params[:general_rating]
    )
    serialize_reviews(review)
  end

end