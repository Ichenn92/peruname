class Character < ApplicationRecord
  belongs_to :character_category

  validates_presence_of :name, :character_category
end
