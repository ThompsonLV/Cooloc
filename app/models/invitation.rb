class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :flatmate
end
