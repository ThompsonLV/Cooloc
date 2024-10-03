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

  def age
    today = Date.today
    age = today.year - birthday.year
    age -= 1 if birthday > today.yday # Si l'anniversaire n'est pas encore passé cette année
    age
  end

  def echeance_birthday
    today = Date.today
    current_year_birthday = Date.new(today.year, self.birthday.month, self.birthday.day)

    if today > current_year_birthday
      next_birthday = Date.new(today.year + 1, self.birthday.month, self.birthday.day)
    else
      next_birthday = current_year_birthday
    end

    (next_birthday - today).to_i
  end

end
