class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags

  validates :name, :price, presence: true

  def average_rating
    avg_rating = reviews.reduce(0) do |sum, review|
      sum + review.rating
    end

    avg_rating /= reviews.length.to_f unless avg_rating.zero?
    avg_rating.round(2)
  end
end
