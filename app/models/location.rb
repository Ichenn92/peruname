class Location < ApplicationRecord
  has_many :performances
  validates_associated :performances

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
