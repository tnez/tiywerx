class AddProfileInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    add_column :users, :blurb, :text
  end
end
