class Location < ActiveRecord::Base
  belongs_to :city
  has_many :reviews
  has_many :favorites
  has_many :users, through: :reviews

  def average_adult_rating
    self.reviews.average(:adult_rating).to_f
  end

  def average_toddler_rating
    self.reviews.average(:toddler_rating).to_f
  end

  def average_preschool_rating
    self.reviews.average(:preschool_rating).to_f
  end

  def average_school_age_rating
    self.reviews.average(:school_age_rating).to_f
  end

  def average_baby_rating
    self.reviews.average(:baby_rating).to_f
  end

  def average_general_rating
    self.reviews.average(:general_rating).to_f
  end

end