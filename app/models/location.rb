class Location < ApplicationRecord
  has_many :performances
  validates_associated :performances

  validates :name, presence: true
  
end
