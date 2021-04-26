class Tag < ApplicationRecord
  has_many :product_tags, dependent: :destroys
  has_many :products, through: :product_tags
end
