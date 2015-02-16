class Course < ActiveRecord::Base
  has_many :cohorts
  has_many :locations, through: :cohorts
end
