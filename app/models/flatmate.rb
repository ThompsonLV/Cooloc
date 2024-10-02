class Flatmate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  #  Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable


  belongs_to :colocation
  has_many :spending_to_flatmates
  has_many :spendings, through: :spending_to_flatmates
  has_many :chores, dependent: :destroy


  def full_name
    "#{first_name} #{last_name}"
  end

end
