class Colocation < ApplicationRecord
  has_many :flatmates, dependent: :destroy
  has_many :chores, dependent: :destroy
end
