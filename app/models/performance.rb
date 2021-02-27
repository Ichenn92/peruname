class Performance < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :location
  belongs_to :performance_category

  validates :user, presence: true #add validation of user where actor is true
  validates :character, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true  #add validation that price_per_hour is an integer > 10
end
