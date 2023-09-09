# frozen_string_literal: true

# This is a top-level documentation comment for the class.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter
      t.string :role 
      t.timestamps
    end
  end
end
