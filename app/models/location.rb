class Location < ApplicationRecord
  has_many :performances
  validates_associated :performances

  validates :city, presence: true
  validates :address, presence: true
end
