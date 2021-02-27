class Character < ApplicationRecord
  has_many :performances

  belongs_to :character_category

  validates_presence_of :name
end
