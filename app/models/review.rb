class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :review_text, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true, message: "must be between 0 and 5" }
end
