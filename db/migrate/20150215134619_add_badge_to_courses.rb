class AddBadgeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :badge, :string
  end
end
