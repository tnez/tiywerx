class Location < ActiveRecord::Base
  has_many :courses, through: :cohorts
end
