class City < ActiveRecord::Base
  has_many :locations
  has_many :users
end