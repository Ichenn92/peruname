class Character < ApplicationRecord
  has_many :performances
  validates_associated :performances

  belongs_to :character_category

  validates_presence_of :name, :character_category
end
