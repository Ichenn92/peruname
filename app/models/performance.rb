class Performance < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :location

  has_one :character_category, through: :character
  belongs_to :performance_category

  validates :user, presence: true
  validates :character, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true

  # TODO: add validation of user where actor is true
  # TODO: add validation that price_per_hour is an integer > 10

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
