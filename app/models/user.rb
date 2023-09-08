# This is a top-level documentation comment for the class.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, # Use database authentication
         :stretches => 13, # Set the cost of the hashing algorithm
         :pepper => 'your_custom_pepper', # Set a custom pepper
         :encryptor => :bcrypt, # Use the bcrypt encryptor (default)
         :confirm_within => 2.days, # Confirmable expiration time
         :remember_for => 2.weeks, # Rememberable expiration time
         :timeout_in => 30.minutes, # Session timeout
         :unlock_in => 1.hour # Account unlock time after too many failed attempts
         
  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Attributes
  attribute :name, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0
  attribute :photo, :string

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Methods
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
