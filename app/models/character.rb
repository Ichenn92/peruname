class Character < ApplicationRecord
  belongs_to :character_category
  enum category: { celebrity: "celebrity",
                   superhero: "superhero",
                   anime: "anime",
                   fake_friend: "fake friend",
                   other: "other" }
  validates_presence_of :name, :category
end
