class LocationCohorts < ActiveRecord::Base
  belongs_to :location
  belongs_to :cohort
end
