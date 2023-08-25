# This is a top-level documentation comment for the class.
class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Attributes
  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

end
