# frozen_string_literal: true

# This is a top-level documentation comment for the class.
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author_id, foreign_key: { to_table: :users }
      t.references :post_id, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
