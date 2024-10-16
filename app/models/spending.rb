class Spending < ApplicationRecord
  has_many :spending_to_flatmates
  has_many :flatmates, through: :spending_to_flatmates
  belongs_to :flatmate
end
