class Cohort < ActiveRecord::Base
  belongs_to :location
  belongs_to :course
  has_many :enrollments
  has_many :users, through: :enrollments

  def location_and_name
    "#{self.location.name} - #{self.course.name}"
  end
end
