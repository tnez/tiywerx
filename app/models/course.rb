class Course < ActiveRecord::Base
  has_many :locations, through: :cohorts
end
