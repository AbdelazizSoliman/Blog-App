# This is a top-level documentation comment for the class.
class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post
end
