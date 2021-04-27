class User < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :full_name, :email, presence: true
  validates :email, uniqueness: true

  enum status: ['admin','active','deactivated']
end
