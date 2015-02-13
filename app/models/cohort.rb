class Cohort < ActiveRecord::Base
  belongs_to :location
  belongs_to :course
  has_many :enrollments
  has_many :users, through: :enrollments
end
