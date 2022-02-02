class Location < ActiveRecord::Base
  belongs_to :city
  has_many :reviews
  has_many :users, through: :reviews

  def average_adult_rating
    all_ratings = 0
    self.reviews.map do |review|
      all_ratings += (review.adult_rating).to_f
      # binding.pry
    end
    average = (all_ratings / self.reviews.length)
  end

end