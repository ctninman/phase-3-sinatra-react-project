class User < ActiveRecord::Base
  belongs_to :city
  has_many :kids
  has_many :reviews
  has_many :locations, through: :reviews
end