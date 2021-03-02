class Performance < ApplicationRecord
  reverse_geocoded_by "locations.latitude", "locations.longitude"

  belongs_to :user
  belongs_to :character
  belongs_to :location

  has_one :character_category, through: :character
  has_many_attached :photos
  belongs_to :performance_category

  validates :user, presence: true
  validates :character, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true

  def self.search_near_performances_with_filter(params)
    performances = Performance.joins(:location).near(params[:address], 5)

    if params[:performance][:character_category].present?
      performances = performances.where(character_id: params[:performance][:character_category])
    end

    performances
  end

  # TODO: add validation of user where actor is true
  # TODO: add validation that price_per_hour is an integer > 10

end
