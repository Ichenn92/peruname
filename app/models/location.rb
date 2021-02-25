class Location < ApplicationRecord
  validates :city, presence: true
  validates :address, presence: true
end
