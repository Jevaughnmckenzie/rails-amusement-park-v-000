class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
  	t.string :name
  	t.string :password_digest
    t.boolean :admin, default: false
    t.integer :happiness
    t.integer :nausea
    t.integer :height
    t.integer :tickets
  end
end
