class MoveLocationCohortAssociationToJoinTable < ActiveRecord::Migration
  def change
    # drop the location_id column we previously created because it
    # means that a cohort can only have one location when we actually
    # want it to belong to many locations
    remove_column :cohorts, :location_id, :integer

    # create the join table associating locations and cohorts
    create_table :location_cohorts do |t|
      t.integer :location_id
      t.integer :cohort_id

      t.timestamps null: false
    end
  end
end
