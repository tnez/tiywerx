class Cohort < ActiveRecord::Base
  has_many :locations, through: :location_cohorts
  has_many :enrollments
  has_many :users, through: :enrollments
end
