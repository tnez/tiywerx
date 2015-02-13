class MoveLocationCohortAssociationToJoinTable < ActiveRecord::Migration
  def change
    # add a course id to the cohort table... a cohort is essentially a
    # specific course at a specific location. It is modeled by a join
    # table between location and course.
    remove_column :cohorts, :name, :string
    add_column :cohorts, :course_id, :integer

    # create a course table
    create_table :course do |t|
      t.string :name
      t.text :description
    end
  end
end
