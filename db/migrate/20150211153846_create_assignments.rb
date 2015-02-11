class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps null: false
    end
  end
end
