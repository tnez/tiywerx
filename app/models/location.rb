class Location < ActiveRecord::Base
  has_many :cohorts
  has_many :courses, through: :cohorts
  has_many :users
end
