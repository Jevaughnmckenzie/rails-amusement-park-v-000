class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  create_table :rides do |t|
  	t.belongs_to :user
  	t.belongs_to :attraction
  end
end
