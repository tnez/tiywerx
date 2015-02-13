class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :content
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
